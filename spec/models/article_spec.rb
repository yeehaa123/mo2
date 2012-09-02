require 'spec_helper'

describe Article do

	let(:user) { FactoryGirl.create(:user) }
	before { @article = user.articles.build(content: "# Lorem ipsum") }

	subject { @article }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:title) }
	it { should respond_to(:user) }
	its(:user) { should == user}

	it { should be_valid }

	it { should validate_presence_of(:user_id) }
	it { should_not allow_mass_assignment_of(:user_id) }

	it { should validate_presence_of(:user_id) }
end
