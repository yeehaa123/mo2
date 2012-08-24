Feature: Signing up
In order to be attributed for my work
As a user
I want to be able to sign up

	Scenario: Signing up
		Given I am on the homepage
		When I follow "sign up"
		When I fill in "Name" with "Dada"
		And I fill in "Email" with "user@example.com"
		And I fill in "Password" with "please"
		And I fill in "Password confirmation" with "please"
		Then sign up should create a user
		And I should see "Welcome Dada"
	
	Scenario: Signing up with Identity after Signing in with Facebook 
		Given I am on the homepage
		And I sign in with provider facebook
		And I visit the sign up page
		When I fill in "Name" with "Dada"
		And I fill in "Email" with "BlaBla@BlaBlaBla.com"
		And I fill in "Password" with "please"
		And I fill in "Password confirmation" with "please"
		Then sign up should not create a user
		And I should see "You can now login using Identity too!" within "div.flash"

	Scenario: Signing up with Identity after Signing in with Facebook 
		Given I am on the homepage
		And I sign in with provider identity
		And I sign in with provider facebook
		Then I should see "You can now login using Facebook too!" within "div.flash"

	Scenario: Signing up with invalid information
		Given I am on the homepage
		When I follow "sign up"
		And I press "Sign up"
		Then sign up should not create a user
		And I should see "Sign up" within "title"
		And I should see "error"