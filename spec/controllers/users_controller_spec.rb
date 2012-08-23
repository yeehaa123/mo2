require 'spec_helper'

describe UsersController do
	let(:user) 				{ FactoryGirl.create(:user) }
	let(:admin) 			{ FactoryGirl.create(:admin) }

  context "for non-signed-in users" do

    describe "making a show request" do
    	before { get :show, id: user } 	
      specify { response.should be_success }
    end

		describe "making a index request" do
			before { get :index } 	
			specify { response.should redirect_to(signin_path) }
		end

		describe "making a edit request" do
			before { get :edit, id: user } 	
			specify { response.should redirect_to(signin_path) }
		end

		describe "submitting to the update action" do
			before { put :update, id: user } 	
			specify { response.should redirect_to(signin_path) }
		end
	end

	context "for signed-in users" do

		before do 
			cookies[:remember_token] = user.remember_token
		end

    describe "making a show request" do
    	before { get :show, id: user } 	
      specify { response.should be_success }
    end

		describe "making a index request" do
			before { get :index } 	
			specify { response.should be_success }
		end

		describe "making a edit request" do
			before { get :edit, id: user } 	
			specify { response.should be_success }
		end

		describe "submitting to the update action" do
			before { put :update, id: user, user: {} } 
			specify { response.should redirect_to(user_path) }
		end

		describe "submitting to the update action of another user" do
			before { put :update, id: admin } 
			specify { response.should redirect_to(root_path) }
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
    	before { get :show, id: user } 	
      specify { response.should be_success }
    end

		describe "making a index request" do
			before { get :index } 	
			specify { response.should be_success }
		end
		
		describe "making a edit request" do
			before { get :edit, id: admin } 	
			specify { response.should be_success }
		end

		describe "submitting to the update action" do
			before { put :update, id: admin, user: { roles: [] } }
			specify { response.should redirect_to(user_path) }
		end

		describe "making a edit another user request" do
			before { get :edit, id: user } 	
			specify { response.should be_success }
		end

		describe "submitting to the update action of another user" do
			before { put :update, id: user, user: { roles: [] } }
			specify { response.should redirect_to(user_path) }
		end
	end
end