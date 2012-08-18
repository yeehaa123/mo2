Feature: Signing in and out
	In order to use the site
	As a user
	I want to be able to sign in

	Scenario: Signing in via form with valid information
		Given a user exists
		And I am on the homepage
		When I follow "sign in"
		And I fill in "Email" with "yeehaa@yeehaa.com"
		And I fill in "Password" with "please"
		And I press "Sign in"
		Then I should be signed in in successfully

		When I follow 'article'
		Then I should not see "Welcome" within "div.flash"
	
	@omniauth
	Scenario: Signing in via facebook
		Given I am on the homepage 
		And I am signed in with provider "facebook"
		Then I should be signed in in successfully

	@omniauth
	Scenario: Signing in via facebook
		Given I am on the homepage 
		And I follow "Facebook Sign in"
		Then I should be signed in in successfully
	
	@omniauth
	Scenario: Signing in via identity
		Given I am on the homepage 
		And I am signed in with provider "identity"
		Then I should be signed in in successfully

	Scenario: Signing in via form with invalid information
		Given I am on the homepage
		And I follow "sign in"
		And I fill in "Email" with "fkflfk"
		And I fill in "Password" with "djdj"
		And I press "Sign in"
		Then I should see "Sign in" within "title"
		And I should see "Authentication failed" within "div.flash"

	Scenario: Signin out
		Given a user exists
		And I am signed in as them
		And I follow "sign out"
		Then I should see a link to the "sign in" page