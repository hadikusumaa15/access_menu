class MenusRolesController < ApplicationController
# the route /menus_roles will run the index method
        # and load the index.html.erb
        def index
            # @menus_roles = MenusRole.all
            @menus_roles = MenusRole.all.order('created_at DESC')
            # same as first line but sort in descending (DESC) order 
            # based on what time they were created
          end
        
          def new
              @menus_role = MenusRole.new
          end
        
        
          def create
            @menus_role = MenusRole.new(menus_role_params)
            if @menus_role.save
              redirect_to @menus_role
            else
              # redirect_to @menus_role
              render 'new'
            end
          end
        
          def show
            @menus_role = MenusRole.find(params[:id])
          end
        
          def edit
            @menus_role = MenusRole.find(params[:id])
          end
        
          def update
            @menus_role = MenusRole.find(params[:id])
            if @menus_role.update(menus_role_params)
              redirect_to @menus_role
            else
              render 'edit'
            end
          end
        
          def destroy
            @menus_role = MenusRole.find(params[:id])
            @menus_role.destroy
            redirect_to root_path
          end
        
          private
        
          def menus_role_params
              # require the :menus_role table
              # security mesure called 'strong params' where we must permit
              # the different attributes (:name, :description) that you 
              # want to allow to be written to our database
              params.require(:menus_role).permit(:menu_id, :role_id);
          end
end
