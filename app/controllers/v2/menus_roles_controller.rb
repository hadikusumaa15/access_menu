class V2::MenusRolesController < ApplicationController
    before_action :check_sign_in, except: :index
    def index
        @param = params[:hotel_id]
        @paramr = params[:role_id]
        @role_id=user_hotels.where(id: params[:hotel_id]).first.roles.where(id: params[:role_id]).first
        @menus_roles= MenusRole.where(role_id: @role_id).all
    end

    def show
        index
        @menus_role=MenusRole.find_by_id(params[:id])
        if @menus_role.nil?
            redirect_to "/v2/hotels/#{@param}/menus_roles/"
        end
    end

    def new
        index
        @menus_role=MenusRole.new
        # @hotelmenus_role=HotelsMenusRole.new
    end

    def create
        index
        @userNow = current_user.admin_type
        @menus_role=MenusRole.new(menus_role_params)
        if @menus_role.save
        redirect_to "/v2/hotels/#{@param}/menus_roles/"
        else
        render 'new'
        end
    end

    def edit

    end

    def update

    end	

    def destroy
    index
        @menus_role = MenusRole.find(params[:id])
        @menus_role.destroy
        redirect_to "/v2/hotels/#{@param}/menus_roles"
    end

        private

    def hotels_menus_roles_params
        params.require(:hotels_menus_roles).permit(:hotel_id, :menus_role_id)
    end

    def menus_role_params
        params.require(:menus_role).permit(:role_id, :created_at, :menu_id);
    end

end
