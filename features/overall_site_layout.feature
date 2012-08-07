Feature: Overall Site Layout
	In order to properly navigate between different pages and sections
	As a user
	I want to be confronted with a well structured, comprehensible site layout

	Scenario: Visiting the Homepage
		Given I am on the homepage
		Then I should see "Welcome to Medial Operations"
		And I should see "Medial Operations" within "title"
		And I should not see "Medial Operations // Home" within "title"


	Scenario: Visiting the About page
		Given I am on the homepage
		And I follow "About"
		Then I should see "About Medial Operations"
		And I should see "Medial Operations // About" within "title"

	Scenario: Visiting the Article page
		Given I am on the homepage
		And I follow "Article"
		Then I should see "Towards a New Intellectual"
		And I should see "Medial Operations // Article" within "title"

	Scenario: Return to Homepage
		Given I am on the homepage
		And I follow "Article"
		And I follow "Home"
		Then I should see "Medial Operations" within "title"
		And I follow "About"
		And I follow "" within ".banner"
		Then I should see "Medial Operations" within "title"