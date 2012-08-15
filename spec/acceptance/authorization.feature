Feature: User Authorization
	In order to prevent unauthorized access to pages and actions
	As the system
	I want to prevent them from doing so

	Scenario: Non-signed-in Users
		Given I am a user
		And I visit my settings page
		Then I should see 'Sign in' within 'title'

		When I submit to the users path
		Then I should get a "401" response

	Scenario: Wrong Users
		Given a user exists
		And I am signed in as them
		And there is another user
		When I visit the settings page of this other user
		Then show me the page
		Then I should not see 'Edit user' within 'title'
		When I submit to the users path
		Then I should get a "401" response