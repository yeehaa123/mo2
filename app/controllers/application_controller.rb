class ApplicationController < ActionController::Base
	protect_from_forgery
	check_authorization
	include SessionsHelper

	rescue_from CanCan::AccessDenied do |exception|    
		redirect_to root_url, alert: "Access denied!"
	end
end