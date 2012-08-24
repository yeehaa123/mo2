require 'spec_helper'

describe UsersController do
	let(:user) 				{ FactoryGirl.create(:user) }
	let(:admin) 			{ FactoryGirl.create(:admin) }


  context "for non-signed-in users" do

    describe "making a show request" do

    	before 	{ get :show, id: user } 	

      it 			{ should respond_with(:success) }
      it 			{ should render_template(:show) }
      it 			{ should_not set_the_flash }
    end

		describe "making a index request" do
			before 	{ get :index } 	

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end

		describe "making a edit request" do
			before 	{ get :edit, id: user }

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end

		describe "submitting to the update action" do
			before 	{ put :update, id: user } 	

			it 			{ should redirect_to(signin_path) }
			it 			{ should set_the_flash.now.to("Please sign in.") }
		end

		describe "submitting to the update action" do
			before 	{ delete :destroy, id: user } 	

			it 			{ should redirect_to(root_path) }
			it 			{ should set_the_flash.now.to("Access denied!") }
		end
	end


	context "for signed-in users" do

		before do 
			cookies[:remember_token] = user.remember_token
		end

    describe "making a show request" do
    	before 	{ get :show, id: user } 	

	    it 			{ should respond_with(:success) }
	    it 			{ should render_template(:show) }
	    it 			{ should_not set_the_flash }	
    end

		describe "making a index request" do
			before 	{ get :index }

	    it 			{ should respond_with(:success) }
	    it 			{ should render_template(:index) }
	    it 			{ should_not set_the_flash }	
		end

		describe "making a edit request" do
			before 	{ get :edit, id: user } 	

	    it 			{ should respond_with(:success) }
	    it 			{ should render_template(:edit) }
	    it 			{ should_not set_the_flash }	
		end

		describe "submitting to the update action" do
			before 	{ put :update, id: user, user: {} } 

			it 			{ should redirect_to(user_path) }
			it 			{ should set_the_flash.now.to("Profile updated") }
		end

		describe "submitting to the destroy action" do
			before 	{ delete :destroy, id: user } 	

			it 			{ should redirect_to(root_path) }
			it 			{ should set_the_flash.now.to("Access denied!") }
		end

		describe "submitting to the update action of another user" do
			before 	{ put :update, id: admin } 

			it 			{ should redirect_to(root_path) }
			it 			{ should set_the_flash.now.to("Access denied!") }
		end
	end


	context "for admin users" do
		
		before do 
			cookies[:remember_token] = admin.remember_token
		end

		describe do
			specify { admin.roles.should include("admin") }
		end

    describe "making a show request" do
    	before 	{ get :show, id: user }

	    it 			{ should respond_with(:success) }
	    it 			{ should render_template(:show) }
	    it 			{ should_not set_the_flash }
    end

		describe "making a index request" do
			before 	{ get :index }

  	  it 			{ should respond_with(:success) }
  	  it 			{ should render_template(:index) }
	    it 			{ should_not set_the_flash }
		end
		
		describe "making a edit request" do
			before 	{ get :edit, id: admin }

	    it 			{ should respond_with(:success) }
	    it 			{ should render_template(:edit) }
	    it 			{ should_not set_the_flash }
		end

		describe "making a edit another user request" do
			before 	{ get :edit, id: user } 	

	    it 			{ should respond_with(:success) }
	    it 			{ should render_template(:edit) }
	    it 			{ should_not set_the_flash }
		end

		describe "submitting to the update action" do
			before 	{ put :update, id: admin, user: { roles: [] } }

			it 			{ should redirect_to(user_path) }
			it 			{ should set_the_flash.now.to("Profile updated") }
		end
		
		describe "submitting to the destroy action" do
			before 	{ delete :destroy, id: admin } 	

			it 			{ should redirect_to(root_path) }
			it 			{ should set_the_flash.now.to("Access denied!") }
		end

		describe "submitting to the update action of another user" do
			before 	{ put :update, id: user, user: { roles: ["admin"] } }

			it 			{ should redirect_to(user_path) }
			it 			{ should set_the_flash.now.to("Profile updated") }
		end

		describe "submitting to the destroy action of another user" do

			before 	do
				delete :destroy, id: user
			end

			it 			{ should redirect_to(users_path) }
			it 			{ should set_the_flash.now.to("User destroyed.") }
		end
	end
end