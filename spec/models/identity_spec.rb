require 'spec_helper'	

describe Identity do
	
	before do
		@identity = Identity.new(name: "Example User", email: "user@example.com", 
														 password: "foobar", password_confirmation: "foobar")
	end

	subject { @identity }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "when name is not present" do
		before { @identity.name = " " }
		it { should_not be_valid}
	end

	describe "when name is too long" do
		before { @identity.name = "a" * 51 }
		it { should_not be_valid}
	end
	
	describe "when email is not present" do
		before { @identity.email = " " }
		it { should_not be_valid}
	end

	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
      	@identity.email = invalid_address
        @identity.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @identity.email = valid_address
        @identity.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
		before do
			identity_with_same_email = Identity.new(name: "Another User", email: "user@example.com", 
														 									password: "foobar", password_confirmation: "foobar")
			identity_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @identity.password = @identity.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password does not match confirmation" do
		before { @identity.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password confirmation is nil" do
		before { @identity.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "with a password that is too short" do
		before { @identity.password = @identity.password_confirmation = "a" * 5 }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @identity.save }
		let(:found_identity) { Identity.find_by(email: @identity.email) }

		describe "with valid password" do
			it { should == found_identity.authenticate(@identity.password) }
		end

		describe "with invalid password" do
			let(:identity_for_invalid_password) { found_identity.authenticate("invalid") }
			it { should_not == identity_for_invalid_password }
			specify { identity_for_invalid_password.should be_false }
		end
	end
end