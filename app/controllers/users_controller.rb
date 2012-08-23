class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  load_and_authorize_resource

  def show
	end

	def index
    @users = User.all.page(params[:page])
  end

  def edit
  end

  def update
    authorize! :assign_roles, @user if params[:user][:roles]
    if @user.update_attributes(params[:user])
      @current_ability = nil
      @current_user = nil
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end