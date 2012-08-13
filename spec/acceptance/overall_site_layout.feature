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

	Scenario: Visiting the Profile page
		Given a user exists
		And I am signed in as them
		And I visit my profile page
		Then show me the page
		Then I should see "#{ @user.name} " within "h1"
		And I should see "Medial Operations // #{ @user.name }" within "title"		
