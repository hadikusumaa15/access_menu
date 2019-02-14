class HotelsController < ApplicationController
# the route /hotels will run the index method
        # and load the index.html.erb
        def index
            # @hotels = Hotel.all
            @hotels = Hotel.all.order('created_at DESC')
            # same as first line but sort in descending (DESC) order 
            # based on what time they were created
          end
        
          def new
              @hotel = Hotel.new
          end
        
        
          def create
            @hotel = Hotel.new(hotel_params)
            # @hotel.create
            if @hotel.save
              # sleep 10
              # Hotel.delay(queue: "hotel", priority: 20, run_at: 1.minutes.from_now).create(params[:id])
              redirect_to root_path, notice: "Creating Hotel at "+Time.zone.now.to_s
            else
              # redirect_to @hotel
              render 'new'
            end
          end
        
          def show
            @hotel = Hotel.find(params[:id])
          end
        
          def edit
            @hotel = Hotel.find(params[:id])
          end
        
          def update
            @hotel = Hotel.find(params[:id])
            if @hotel.update(hotel_params)
              redirect_to @hotel, notice: "Hotel updated"
            else
              render 'edit'
            end
          end
        
          def destroy
            @hotel = Hotel.find(params[:id])
            @hotel.destroy
            redirect_to root_path, notice: "Hotel deleted"
          end



# def deliver
#   @newsletter = Newsletter.find(params[:id])
#   sleep 10 # simulate long newsletter delivery
#   @newsletter.update_attribute(:delivered_at, Time.zone.now)
#   redirect_to newsletters_url, notice: "Delivered newsletter."
# end


        
          private
        
          def hotel_params
              # require the :hotel table
              # security mesure called 'strong params' where we must permit
              # the different attributes (:name, :description) that you 
              # want to allow to be written to our database
              params.require(:hotel).permit(:name, :package_id, :id, :updated_at);
          end
end
