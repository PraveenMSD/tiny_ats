class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def require_user
        if !user_signed_in?
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to new_user_session_path
        end
    end
end
