class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  	def require_signin!
  		if current_user.nil?
  			flash[:error] = 'You need to sign in or sign up or something first.'
  			redirect_to signin_url
  		end
  	end
  	helper_method :require_signin!

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

    def authorize_admin!
      require_signin!

      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
      end
    end
end
