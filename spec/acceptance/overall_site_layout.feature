Feature: Overall Site Layout
	In order to properly navigate between different pages and sections
	As a user
	I want to be confronted with a well structured, comprehensible site layout

	Scenario: Visiting the Homepage
		Given I am on the homepage
		Then I should see "Welcome to Medial Operations"
		And I should see "Medial Operations" within "title"
		And I should not see "Home" within "title"

	Scenario: Visiting the Article page
		Given I am on the homepage
		And I follow "article"
		Then I should see "The Good Foot"
		And I should see "Medial Operations // Article" within "title"

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
		Given an identity exists
		And I am signed in as them
		And I am on the homepage
		And I follow 'profile'
		Then I should see my name within "h1"
		And I should see my name within "title"

	Scenario: Visting a User's Edit page
		Given an identity exists
		And I am signed in as them
		And I am on the homepage
		And I follow 'settings'
		Then I should see 'Update your profile' within "h1"
		And I should see 'Edit user' within "title"
		And I should see a link 'change' to "http://gravatar.com/emails"