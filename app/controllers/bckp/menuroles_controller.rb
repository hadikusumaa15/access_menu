class MenurolesController < ApplicationController
    def index
        # @menuroles = MenusRole.all
        @menuroles = MenusRole.all.order('created_at DESC')
        # same as first line but sort in descending (DESC) order 
        # based on what time they were created
      end
    
      def new
          @menurole = MenusRole.new
      end
    
    
      def create
        @menurole = MenusRole.new(menurole_params)
        if @menurole.save
          redirect_to @menurole
        else
          # redirect_to @menurole
          render 'new'
        end
      end
    
      def show
        @menurole = MenusRole.find(params[:id])
      end
    
      def edit
        @menurole = MenusRole.find(params[:id])
      end
    
      def update
        @menurole = MenusRole.find(params[:id])
        if @menurole.update(menurole_params)
          redirect_to @menurole
        else
          render 'edit'
        end
      end
    
      def destroy
        @menurole = MenusRole.find(params[:id])
        @menurole.destroy
        redirect_to root_path
      end
    
      private
    
      def menurole_params
          # require the :menurole table
          # security mesure called 'strong params' where we must permit
          # the different attributes (:name, :description) that you 
          # want to allow to be written to our database
          params.require(:menus_role).permit(:menu_id, role_id);
      end
end
