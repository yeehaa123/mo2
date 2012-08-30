Feature: Overall Site Layout
	In order to properly navigate between different pages and sections
	As a user
	I want to be confronted with a well structured, comprehensible site layout

	Scenario: Visiting the Homepage
		Given I am on the homepage
		Then I should see "Welcome to Medial Operations"
		And I should see "Medial Operations" within "title"
		And I should not see "Home" within "title"

	# Scenario: Visiting the Article page
	# 	Given I am on the homepage
	# 	And I follow "article"
	# 	Then I should see "The Good Foot"
	# 	And I should see "Medial Operations // Article" within "title"

	Scenario: Return to Homepage
		Given I am on the homepage
		And I follow "article"
		And I follow "" within ".banner"
		Then I should see "Medial Operations" within "title"

	Scenario: Visiting the Signup page
		Given I am on the homepage
		And I follow 'sign up'
		Then I should see "Sign up" within "h1"
		And I should see "Medial Operations // Sign up" within "title"

	Scenario: Visiting the Signin page
		Given I am on the homepage
		And I follow 'sign in'
		Then I should see "Sign in" within "h1"
		And I should see "Medial Operations // Sign in" within "title"

	Scenario: Visiting a User's Profile page
		Given I am on the homepage
		When I sign in with provider "identity"
		And I have 2 articles
		And I follow 'profile'
		Then I should see my name within "h1"
		And I should see my name within "title"
		And I should see my articles
		And I should see my article count
	
	Scenario: Visting a User's Edit page
		Given I am on the homepage
		And I sign in with provider "identity"
		And I follow 'settings'
		Then I should see 'Update your profile' within "h1"
		And I should see 'Edit user' within "title"
		And I should see a link 'change' to "http://gravatar.com/emails"

	Scenario: Visting the user index with pagination
		Given I am on the homepage
		And I sign in with provider "identity"	
		And 30 users exist
		And I follow 'users'
		Then I should see 'All users' within "h1"
		And I should see 'All users' within "title"
		And the page should have a '.pagination'
		And it should list each user
		And I should not see a 'delete' link