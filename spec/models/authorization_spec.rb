require 'spec_helper'	

describe Identity do
	let(:user) { FactoryGirl.create(:user) }
	
	before do
		@auth						= Authorization.new
		@auth.user 			= user.id
		@auth.provider 	= "blabook" 
		@auth.uid 			= "12345"
	end

	subject { @auth }
	
	it { should respond_to(:user) }
	it { should respond_to(:provider) }
	it { should respond_to(:uid) }

	it { should be_valid }

	describe "when user is not present" do
		before { @auth.user_id = " " }
		it { should_not be_valid }
	end

	describe "when provider is not present" do
		before { @auth.provider = " " }
		it { should_not be_valid }
	end

	describe "when uid is not present" do
		before { @auth.uid = " " }
		it { should_not be_valid }
	end

	describe "should output to string" do
		it { "#{ @auth }".should == "#{ @auth.provider } - #{ @auth.uid }" }
	end
end