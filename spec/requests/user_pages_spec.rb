require 'spec_helper'

describe "User pages" do
	
	subject { page }

	describe "signup" do

		before { visit signup_path }

		let(:submit) { "Sign up" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end
		
		describe "with valid information" do
			before do
				fill_in "Name", 											with: "Example User"
				fill_in "Email", 											with: "altuser@example.com"
				fill_in "Password", 									with: "foobar"
				fill_in "Password confirmation", 			with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count)
			end
		end
	end
end