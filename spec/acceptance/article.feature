Feature: Creating and Editing Articles
	In order to manage articles on the site
	As a user
	I want to be able to publish and edit articles

	Scenario: Article creation with invalid information
		Given I sign in with provider identity
		And I am an admin
		When I visit the new articles page
		Then I cannot create an article

		And I fill in 'article_content' with 'Hello'
		Then I cannot create an article

	Scenario: Article creation with valid information
		Given I sign in with provider identity
		And I am an admin
		When I visit the new articles page
		And I fill in 'article_content' with '# Hello'
		Then I can create an article
