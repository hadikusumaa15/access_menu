class PackagesController < ApplicationController
    def index
        # @packages = Package.all
        @packages = Package.all.order('created_at DESC')
        # same as first line but sort in descending (DESC) order 
        # based on what time they were created
      end
    
      def new
          @package = Package.new
      end
    
    
      def create
        @package = Package.new(package_params)
        if @package.save
          redirect_to @package
        else
          # redirect_to @package
          render 'new'
        end
      end
    
      def show
        @package = Package.find(params[:id])
      end
    
      def edit
        @package = Package.find(params[:id])
      end
    
      def update
        @package = Package.find(params[:id])
        if @package.update(package_params)
          redirect_to @package
        else
          render 'edit'
        end
      end
    
      def destroy
        @package = Package.find(params[:id])
        @package.destroy
        redirect_to root_path
      end
    
      private
    
      def package_params
          # require the :package table
          # security mesure called 'strong params' where we must permit
          # the different attributes (:name, :description) that you 
          # want to allow to be written to our database
          params.require(:package).permit(:name);
      end
end
