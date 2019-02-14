class V1::RolesController < ApplicationController
	before_action :check_sign_in
	def index
		user_hotels.where(id: params[:hotel_id])
	end

	def show

	end

	def edit

	end

	def update

	end	
end