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

	it { should validate_presence_of(:name) }
	it { should ensure_length_of(:name).is_at_most(50) }

	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }

  context "when email format is invalid" do
    describe "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
				it { should_not allow_value(invalid_address).for(:email) }
      end      
    end
  end
	
  context "when email format is valid" do
    describe "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
				it { should allow_value(valid_address).for(:email) }
      end      
    end
  end
	
	describe "email address with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be save as all lower-case" do
			@identity.email = mixed_case_email
			@identity.save
			@identity.reload.email.should == mixed_case_email.downcase
		end
	end

	it { should validate_presence_of(:password) }
	it { should ensure_length_of(:password).is_at_least(6) }
	it { should validate_confirmation_of(:password) }
	it { should_not allow_value(nil).for(:password_confirmation) }

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