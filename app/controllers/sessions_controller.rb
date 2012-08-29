class SessionsController < ApplicationController
  skip_authorization_check

  def new
  end
	
  def create
    # raise env['omniauth.auth'].to_yaml
    auth_hash = request.env['omniauth.auth']
    origin    = request.env['omniauth.origin'] || root_path

    if signed_in?
      # Means our user is signed in. Add the authorization to the user
      current_user.add_provider(auth_hash)
      
      flash[:notice] = "You can now login using #{ auth_hash["provider"]
                          .capitalize } too!"
      redirect_to origin, only_path: true
    else
      # Log him/her in or sign him/her up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      sign_in(auth.user)

      flash[:notice] = "Welcome #{ auth.user.user_name }"
      redirect_to origin, only_path: true
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