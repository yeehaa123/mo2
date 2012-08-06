Feature: Overall Site Layout
	In order to properly navigate between different pages and sections
	As a user
	I want to be confronted with a well structured, comprehensible site layout

	Scenario: Visiting the Homepage
		Given I am on the homepage
		Then I should see "Welcome to Medial Operations"
		And I should see "Medial Operations" within "title"