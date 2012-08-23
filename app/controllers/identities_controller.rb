class IdentitiesController < ApplicationController
	skip_authorization_check

	def new
		@identity = env['omniauth.identity']
	end
end