class AdminsController < ApplicationController
    def set_role
        admin = Admin.find_by_id(1)
        admin.update_attributes(:role_id => 2)
    end

    def saksak_e
        response = Admin.saksak_e
        render json: response
    end
end
