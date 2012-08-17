require 'spec_helper'

describe Identity do

	let(:identity) { FactoryGirl.create(:identity) }
	
	subject { identity }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should be_valid }

	describe "when name is not present" do
		before { identity.name = " " }
		it { should_not be_valid}
	end

	describe "when name is too long" do
		before { identity.name = "a" * 51 }
		it { should_not be_valid}
	end
	
	describe "when email is not present" do
		before { identity.email = " " }
		it { should_not be_valid}
	end

	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
      	identity.email = invalid_address
        identity.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        identity.email = valid_address
        identity.should be_valid
      end      
    end
  end
end
