class V2::DashboardsController < ApplicationController
	# before_action :check_sign_in, except: :index
	# before_action :doorkeeper_authorize!
	# doorkeeper_for :all

	# doorkeeper_for :all
	self.responder = ApplicationResponder
	respond_to :json


	def index
		Role.all
		# user = User.find(doorkeeper_token.resource_owner_id)
		@user = current_user
	end

	def home
		@user = current_user
	end
end