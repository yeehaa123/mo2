module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
	  @current_user ||= User.where(remember_token: cookies[:remember_token])
	  									.first if cookies[:remember_token]
	end

	def current_user?(user)
		user == current_user
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def signed_in_user
		redirect_to signin_path, notice: "Please sign in." unless signed_in?
	end
end