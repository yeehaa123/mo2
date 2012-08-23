require "cancan/matchers"
require 'spec_helper'

describe "User" do
	describe "abilities" do
		subject { ability }
		let(:ability) { Ability.new(user) }

		context "when is an user" do
			let(:user) { FactoryGirl.create(:user) }
			let(:wrong_user) { FactoryGirl.create(:user) }

			it { should be_able_to(:read, User.new) }
			it { should_not be_able_to(:manage, User.new) }
			it { should be_able_to(:edit, user) }
			it { should_not be_able_to(:edit, wrong_user) }
			it { should be_able_to(:update, user) }
			it { should_not be_able_to(:update, wrong_user) }
			it { should_not be_able_to(:assing_roles, user) }
			it { should_not be_able_to(:assing_roles, wrong_user) }
		end

		context "when is an admin" do
			let(:user) { FactoryGirl.create(:admin) }
			let(:other_user) { FactoryGirl.create(:user) }
			
			it { user.roles.should == ["admin"] }
			it { should be_able_to(:read, User.new) }
			it { should be_able_to(:manage, User.new) }
			it { should be_able_to(:edit, user) }
			it { should be_able_to(:edit, other_user) }
			it { should be_able_to(:update, user) }
			it { should be_able_to(:update, other_user) }
			it { should be_able_to(:assing_roles, user) }
			it { should be_able_to(:assing_roles, other_user) }
		end
	end
end