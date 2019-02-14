class V1::DashboardsController < ApplicationController
	before_action :check_sign_in, except: :index

	def index

	end

	def home
		@user = current_user
	end
end