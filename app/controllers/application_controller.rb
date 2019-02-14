require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

    # before_action :check_sign_in, except: :index
    protect_from_forgery with: :exception
    before_action :sanitize_devise_params, if: :devise_controller?

    def sanitize_devise_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role_id])
    end

    def after_sign_up_path_for(resource)
        home_v2_dashboards_path
    end
    def after_sign_in_path_for(resource_or_scope)
        # home_v1_dashboards_path
        home_v2_dashboards_path
        # root_path
    end

    def user_hotels
        current_user.hotels
    end

    def check_sign_in
        if !user_signed_in?
            redirect_to root_path
        end
    end


end
