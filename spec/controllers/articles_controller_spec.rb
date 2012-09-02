require 'spec_helper'

describe ArticlesController do
	let(:user) 				{ FactoryGirl.create(:user) }
	let(:admin) 			{ FactoryGirl.create(:admin) }
	let(:article) 		{ FactoryGirl.create(:article) }

	context "for non-signed-in users" do

		describe "making a index request" do
			before 	{ get :index } 	

			it 			{ should respond_with(:success) }
			it 			{ should render_template(:index) }
      it 			{ should_not set_the_flash }
		end

    describe "making a show request" do

    	before 	{ get :show, id: article } 	

      it 			{ should respond_with(:success) }
      it 			{ should render_template(:show) }
      it 			{ should_not set_the_flash }
    end

		describe "making a new request" do
			before 	{ get :new } 	

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end

		describe "submitting to the create action" do
			before 	{	post :create }

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end
		
		describe "making a edit request" do
			before 	{ get :edit, id: article }

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end

		describe "submitting to the update action" do
			before 	{ put :update, id: article } 	

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end

		describe "submitting to the destroy action" do
			before 	{ delete :destroy, id: article } 	

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end
	end

	context "for admin users" do
		before do 
			cookies[:remember_token] = admin.remember_token
		end

		describe do
			specify { admin.roles.should include("admin") }
		end
		
		describe "submitting to the create action" do
			before 	{ post :create, article: { content: "# HELLO" } }

			it 			{ should redirect_to(article_path(admin.articles.last)) }
			it 			{ should set_the_flash.now.to("Article created") }
		end

		describe "submitting to the create action without title" do
			before 	{ post :create, article: { content: "HELLO" } }

			it 			{ should render_template(:new) }
			it 			{ should_not set_the_flash }
		end
	end
end