class V1::UsersController < ApplicationController
	before_action :check_sign_in
	def index
		@hotel_users = user_hotels.where(id: params[:hotel_id]).first.users
		@hotel_id = params[:hotel_id]
	end

	def new

	end

	def show

	end

	def edit

	end

	def update

	end
end