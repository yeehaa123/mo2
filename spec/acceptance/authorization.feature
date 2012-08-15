Feature: User Authorization
	In order to prevent unauthorized access to pages and actions
	As the system
	I want to prevent them from doing so

	Scenario: Non-signed-in Users
		Given I am a user
		And I visit my settings page
		Then I should see 'Sign in' within 'title'
