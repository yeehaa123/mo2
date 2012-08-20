Feature: Viewing and edditing user information
	As a signed-in user
	I want to be able to edit my profile
	
	@omniauth
	Scenario: Viewing user information
		Given I sign in with provider identity
		And I visit my profile page
	
	@omniauth
	Scenario: Entering invalid information
		Given I sign in with provider identity
		And I visit my settings page
		And I fill in "Email" with "tada"
		When I press 'Save changes'
		Then I should see 'error'

	@omniauth
	Scenario: Viewing user information
		Given I sign in with provider identity
		And I visit my settings page
		When I fill in "User" with "New Name"
		And I fill in "Email" with "new@example.com"
		And I press "Save changes"
		Then I should see "New Name" within "title"
		And I should see a flash success
		And I should be able to sign out
		And my user_name should be updated in the database to "New Name"
		And my email should be updated in the database to "new@example.com"