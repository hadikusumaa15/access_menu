class ApplicationController < ActionController::Base
    
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

    # def create
    #     # find Auction related to new Bid
    #     @user = User.find(params[:role_id])
    #     @ = @user.bids.create(bid_params)
    #     @bid.user_id = current_user.id
    #     # Find the bidder within User Table
    #     @bidder = User.find(@bid.user_id)
    #     @bid.save
    #     redirect_to auction_path(@auction), :notice => "Bid placed"
    #   end

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
