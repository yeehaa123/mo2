Feature: Editing user information
	As an admin
	I want to be able to manage the website
	
	Background:
		Given 10 users exist
		And I sign in with provider "identity"
		And I am an admin

	Scenario: Deleting users
		Given I visit the user index
		Then I should be able to delete another user
		But I should not be able to delete myself