class V1::HotelsController < ApplicationController
	before_action :check_sign_in
	def index
		@hotels = user_hotels
	end

	def show
		@hotel = user_hotels.where(id: params[:id]).first
		if @hotel.nil?
			redirect_to root_path
		end
	end
end