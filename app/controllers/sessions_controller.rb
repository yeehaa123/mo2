class SessionsController < ApplicationController
  def new
  end
	
  def create
    # raise env['omniauth.auth'].to_yaml
    auth_hash = request.env['omniauth.auth']

    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)

      redirect_to root_url, notice: "You can now login using #{ auth_hash["provider"].capitalize } too!"
    else
      # Log him/her in or sign him/her up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      session[:user_id] = auth.user.id

      redirect_to root_url, notice: "Welcome #{ auth.user.name }"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end


# def create
#   raise env['omniauth.auth'].to_yaml
# end