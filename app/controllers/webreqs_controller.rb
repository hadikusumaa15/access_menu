class WebreqsController < ApplicationController
    def index
        # @webreqs = Webreq.all
        @webreqs = Webreq.all
        # same as first line but sort in descending (DESC) order 
        # based on what time they were created
      end
    
      def new
          @webreq = Webreq.new
      end
    
    
      def create
        @webreq = Webreq.new(webreq_params)
        if @webreq.save
          redirect_to @webreq
        else
          render 'new'
        end
      end
    
      def show
        @webreq = Webreq.find(params[:id])
      end
    
      def edit
        @webreq = Webreq.find(params[:id])
      end
    
      def update
        @webreq = Webreq.find(params[:id])
        if @webreq.update(webreq_params)
          redirect_to @webreq
        else
          render 'edit'
        end
      end
    
      def destroy
        @webreq = Webreq.find(params[:id])
        @webreq.destroy
        redirect_to root_path
      end
    
      private
    
      def webreq_params
          # require the :webreq table
          # security mesure called 'strong params' where we must permit
          # the different attributes (:title, :description) that you 
          # want to allow to be written to our database
          params.require(:webreq).permit(:url);
      end
end
