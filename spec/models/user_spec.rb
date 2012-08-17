require 'spec_helper'

describe User do

	before do 
		@user = User.new(name: "Example User", email: "user@example.com")
	end

	subject { @user }
	
	# it { should respond_to(:provider) }
	# it { should respond_to(:uid) }
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:image) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid}
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid}
	end
	
	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid}
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = User.new(name: "Another User", email: "USER@EXAMPLE.COM", 
														 									password: "foobar", password_confirmation: "foobar")
			user_with_same_email.save
		end

		it { should_not be_valid }
	end
	
	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be save as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			@user.reload.email.should == mixed_case_email.downcase
		end
	end
end
