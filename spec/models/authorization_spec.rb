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

	it { should validate_presence_of(:user_id) }
	it { should validate_presence_of(:provider) }
	it { should validate_presence_of(:uid) }

	describe "should output to string" do
		it { "#{ @auth }".should == "#{ @auth.provider } - #{ @auth.uid }" }
	end
end