Feature: Signing in and out
	In order to use the site
	As a user
	I want to be able to sign in

	Scenario: Signing in via form with valid information
		Given an identity exists
		And I am on the homepage
		When I follow "sign in"
		And I fill in "Email" with "yeehaa@yeehaa.com"
		And I fill in "Password" with "please"
		And I press "Sign in"
		Then I should see 'Welcome' within 'div.flash'

		When I follow 'article'
		Then I should not see "Welcome" within "div.flash"
	
	Scenario: Signing in via facebook
		Given I am on the homepage 
		And I sign in with provider "facebook"
		Then I should be signed in in successfully

	Scenario: Signing in via google
		Given I am on the homepage 
		And I sign in with provider "google_oauth2"
		Then I should be signed in in successfully

	Scenario: Signing in via github
		Given I am on the homepage 
		And I sign in with provider "github"
		Then I should be signed in in successfully

	Scenario: Signing in via facebook (link)
		Given I am on the homepage 
		And I follow the Facebook "Sign in" link
		Then I should be signed in in successfully
	
	Scenario: Signing in via identity
		Given I am on the homepage 
		And I sign in with provider "identity"
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
		Given I am on the homepage 
		And I sign in with provider "identity"		
		And I follow "sign out"
		Then I should see a link to the "sign in" page