class V2::UsersController < ApplicationController
	before_action :check_sign_in, except: :index
	def index
		# @hotel_users = user_hotels.where(id: params[:hotel_id]).all
		
		# @hotel_users = user_hotels.all
		# HotelsUser.hotel_id.where(id: 1).user_id
		@hotel_id = params[:hotel_id]
		@hotel_users = user_hotels.where(id: params[:hotel_id]).first.users
		@package = Package.find_by_id(Hotel.find_by_id(@hotel_id).package_id).maxuser
	end

	def new
		
	end

	def show

	end

	def edit
		index
		@hotel_user = @hotel_users.find_by_id(params[:id])
	end
	
	def update
		@hotel_id = params[:hotel_id]
		edit
		if @hotel_user.update(user_params)
		#   redirect_to @hotel_user
		  redirect_to v2_hotel_users_path
		else
		  render 'edit'
		end
	end

	def destroy
		edit
		HotelsUser.where(hotel_id: @hotel_id, user_id: @hotel_user.id).all.each do |d|
		d.destroy
		end
	# @hotel_user.destroy
	end

	private
        
	def user_params
		# require the :user table
		# security mesure called 'strong params' where we must permit
		# the different attributes (:name, :description) that you 
		# want to allow to be written to our database
		params.require(:user).permit(:email, :role_id);
	end
end