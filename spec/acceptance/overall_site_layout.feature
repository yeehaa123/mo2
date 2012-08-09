Feature: Overall Site Layout
	In order to properly navigate between different pages and sections
	As a user
	I want to be confronted with a well structured, comprehensible site layout

	Scenario: Visiting the Homepage
		Given I am on the homepage
		Then I should see "Welcome to Medial Operations"
		And I should see "Medial Operations" within "title"
		And I should not see "Medial Operations // Home" within "title"

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