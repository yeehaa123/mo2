Feature: User Authorization
	In order to prevent unauthorized access to pages and actions
	As the system
	I want to prevent them from doing so

	Scenario: Accessing settings page by non-signed-in users
		Given I am a user
		And I visit my settings page
		Then I should see 'Sign in' within 'title'

	Scenario: Accessing user index by non-signed-in users
		Given I am a user
		And I visit the user index
		Then I should see 'Sign in' within 'title'
	
	Scenario: Submitting to the user's path by non-signed-in users
		Given I am a user
		When I illegally submit to the users path
		Then I am redirected to the signin path

	Scenario: Accessing another user's setting page
		Given an identity exists
		And I am signed in as them
		And there is another user
		When I visit her settings page
		Then I should not see 'Edit user' within 'title'
	
	@omniauth
	Scenario: Accessing another user's setting page (Omniauth)
		Given I sign in with provider identity
		And there is another user
		When I visit his settings page
		Then I should not see 'Edit user' within 'title'
		And I should see "Welcome to Medial Operations"

	Scenario: Submitting to another user's path by signed-in users
		Given a user exists
		And there is another user
		When I illegally submit to the other users path
		Then I am redirected to the root path

	Scenario: Submitting to user's path by signed-in user
		Given a user exists
		And there is another user
		When I legally submit to the users path
		Then I am redirected to the user path
	
	@omniauth
	Scenario: Friendly forwarding
		Given I am on the homepage
		And I follow 'article'
		And I sign in with provider identity
		Then I should see 'Article' within 'title'