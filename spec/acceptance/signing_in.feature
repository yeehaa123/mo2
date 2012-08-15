Feature: Signing in
	In order to use the site
	As a user
	I want to be able to sign in

	Scenario: Signing in via confirmation
		Given there are the following users:
			| name 	| email 						| password 	| password_confirmation | unconfirmed 	|
			| user 	| user@example.com 	| please 		| please 								| true 					|
		And "user@example.com" opens the email with subject "Confirmation instructions"
		And they click the first link in the email
		Then I should see "Your account was successfully confirmed"
		And I should see "user" within "title"

	@javascript
	Scenario: Signing in via form with valid information
		Given a user exists
		And I am signed in as them
		Then I should see "Signed in successfully" within "div.flash"
		And I should see "user" within "title"
		And I could go to my profile page
		And I could go to my settings page
		And I could sign out
		And I should not see a link to the "sign up" page
		And I should not see a link to the "sign in" page

		When I follow 'article'
		Then I should not see "Signed in successfully" within "div.flash"

	Scenario: Signing in via form with invalid information
		Given I am on the homepage
		And I follow "sign in"
		And I press "Sign in"
		Then I should see "Sign in" within "title"
		And I should see "Invalid" within "div.flash"

	Scenario: Signin out
		Given a user exists
		And I am signed in as them
		And I follow "sign out"
		Then I should see a link to the "sign in" page