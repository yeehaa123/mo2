Feature: Signing up
In order to be attributed for my work
As a user
I want to be able to sign up

	Scenario: Signing up with valid information
		Given I am on the homepage
		When I follow "sign up"
		And I fill in "Name" with "Dada"
		And I fill in "Email" with "user@example.com"
		And I fill in "Password" with "please"
		And I fill in "Password confirmation" with "please"
		And I press "Sign up"
		Then I should see "A message with a confirmation link has been sent to your email address."