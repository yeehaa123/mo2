Feature: Signing up
In order to be attributed for my work
As a user
I want to be able to sign up

	Scenario: Signing up
		Given I am on the homepage
		When I follow "Sign up"
		And I fill in "Name" with "Dada"
		And I fill in "Email" with "user@example.com"
		And I fill in "Password" with "please"
		And I fill in "Password confirmation" with "please"
		And I press "Sign up"
		Then I should see "You have signed up successfully."
		# Then I should see "Please confirm your account before signing in."