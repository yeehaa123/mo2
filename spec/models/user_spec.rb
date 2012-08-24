require 'spec_helper'

describe User do

	before do 
		@user = User.new(user_name: "Example User", email: "user@example.com")
	end

	subject { @user }
	
	it { should respond_to(:user_name) }
	it { should respond_to(:email) }
	it { should respond_to(:remember_token)}
	it { should respond_to(:roles) }
	it { should respond_to(:is?) }

	it { should be_valid }

	it { should validate_presence_of(:user_name) }
	it { should ensure_length_of(:user_name).is_at_most(50)}
	
	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
	
	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be save as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			@user.reload.email.should == mixed_case_email.downcase
		end
	end

	describe "remember token" do
		before { @user.save }
		its(:remember_token) { should_not be_blank }	
	end

	describe "with admin attribute set to true" do
		before { @user.roles = ['admin'] }

		it { @user.is?("admin").should be_true }
	end
end
