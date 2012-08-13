Feature: Signing in
	In order to use the site
	As a user
	I want to be able to sign in

	Scenario: Signing in via confirmation
		Given there are the following users:
			| name 	| email 						| password 	| password_confirmation | unconfirmed 	|
			| user 	| user@example.com 	| please 		| please 								| true 					|
		And "user@example.com" opens the email with subject "Confirmation instructions"
		And they click the first link in the email
		Then I should see "Your account was successfully confirmed"
		And I should see "Signed in as user@example.com"

	Scenario: Signing in via form
		Given there are the following users:
			| name 	| email 						| password 	| password_confirmation |
			| user 	| user@example.com 	| please   	| please 								|
		And I am signed in as them