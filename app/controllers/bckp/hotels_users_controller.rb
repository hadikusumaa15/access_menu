class HotelsUsersController < ApplicationController
        # the route /hotels_users will run the index method
                # and load the index.html.erb
                def index
                    # @hotels_users = HotelsUser.all
                    @hotels_users = HotelsUser.all.order('created_at DESC')
                    # same as first line but sort in descending (DESC) order 
                    # based on what time they were created
                  end
                
                  def new
                      @hotels_user = HotelsUser.new
                  end
                
                
                  def create
                    @hotels_user = HotelsUser.new(hotels_user_params)
                    if @hotels_user.save
                      redirect_to @hotels_user
                    else
                      # redirect_to @hotels_user
                      render 'new'
                    end
                  end
                
                  def show
                    @hotels_user = HotelsUser.find(params[:id])
                  end
                
                  def edit
                    @hotels_user = HotelsUser.find(params[:id])
                  end
                
                  def update
                    @hotels_user = HotelsUser.find(params[:id])
                    if @hotels_user.update(hotels_user_params)
                      redirect_to @hotels_user
                    else
                      render 'edit'
                    end
                  end
                
                  def destroy
                    @hotels_user = HotelsUser.find(params[:id])
                    @hotels_user.destroy
                    redirect_to root_path
                  end
                
                  private
                
                  def hotels_user_params
                      # require the :hotels_user table
                      # security mesure called 'strong params' where we must permit
                      # the different attributes (:name, :description) that you 
                      # want to allow to be written to our database
                      params.require(:hotels_user).permit(:hotel_id, :user_id);
                  end
        
end
