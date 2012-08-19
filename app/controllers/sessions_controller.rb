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
      cookies[:remember_token] = auth.user.remember_token

      redirect_to origin, notice: "Welcome #{ auth.user.name }"
    end
  end

  def destroy
    cookies[:remember_token] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to signin_path, alert: "Authentication failed, please try again."
  end
end


# def create
#   raise env['omniauth.auth'].to_yaml
# end