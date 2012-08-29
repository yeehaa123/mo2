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
	it { should respond_to(:articles)}

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

	describe "slug for user pages" do
		before do 
			@user.save
		end

		its(:slug) { should == @user.user_name.parameterize }
		
		describe "for users with existing name" do
			before { @user = User.create(user_name: "Example User", email: "user2@example.com") }
			its(:slug) { should == "#{@user.user_name.parameterize}-1" }
		end
	end

	describe "article associations" do
		before { @user.save }
		let!(:older_article) do
			FactoryGirl.create(:article, user: @user, created_at: 1.day.ago)
		end
		let!(:newer_article) do
			FactoryGirl.create(:article, user: @user, created_at: 1.hour.ago)
		end

		it "should have the right articles in the right order" do
			@user.articles.should == [newer_article, older_article]
		end

		it "should destroy associated articles" do
			articles = @user.articles
			@user.destroy
			articles.each do |article|
				Article.where(id: article.id).first.should be_nil
			end
		end
	end
end