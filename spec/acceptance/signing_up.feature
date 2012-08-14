Feature: Signing up
In order to be attributed for my work
As a user
I want to be able to sign up

	Scenario: Signing up
		Given I am on the homepage
		When I follow "sign up"
		Then I should see "Sign up" within "h1"
		And I should see "Sign up" within "title"
		When I fill in "Name" with "Dada"
		And I fill in "Email" with "user@example.com"
		And I fill in "Password" with "please"
		And I fill in "Password confirmation" with "please"
		And I press "Sign up"
		Then I should see "A message with a confirmation link has been sent to your email address"

	Scenario: Signing up with invalid information
		Given I am on the homepage
		When I follow "sign up"
		And I press "Sign up"
		Then I should see "Sign up" within "title"
		And I should see "error"