class SessionsController < ApplicationController
  def new
  end
	
  def create
    # raise env['omniauth.auth'].to_yaml
    auth_hash = request.env['omniauth.auth']
    origin    = request.env['omniauth.origin'] || root_path

    if signed_in?
      # Means our user is signed in. Add the authorization to the user
      current_user.add_provider(auth_hash)

      redirect_to root_url, notice: "You can now login using #{ auth_hash["provider"].capitalize } too!"
    else
      # Log him/her in or sign him/her up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      sign_in(auth.user)

      redirect_to origin, notice: "Welcome #{ auth.user.user_name }"
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Signed out!"
  end

  def failure
    redirect_to signin_path, alert: "Authentication failed, please try again."
  end
end