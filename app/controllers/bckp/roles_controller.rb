class RolesController < ApplicationController

    # the route /roles will run the index method
    # and load the index.html.erb
    def index
      # @roles = Role.all
      @roles = Role.all.order('created_at DESC')
      # same as first line but sort in descending (DESC) order 
      # based on what time they were created
    end
  
    def new
        @role = Role.new
    end
  
  
    def create
      @role = Role.new(role_params)
      #  @role.delay
      if Role.delay.create(role_params)
        # if @role.save
       
        # else
        #   redirect_to '/'
        # end
        # Role.create.update_attributes(:name => "Taufan", :created_at => Time.zone.now)
        # @role.delay.update_attribute(:created_at, Time.zone.now)
        redirect_to '/indexr'
        # @role.updat
      else
        # redirect_to @role
        render 'new'
      end
    end
  
    def show
      @role = Role.find(params[:id])
    end
  
    def edit
      @role = Role.find(params[:id])
    end
  
    def update
      @role = Role.find(params[:id])
      if @role.update(role_params)
        redirect_to @role
      else
        render 'edit'
      end
    end
  
    def destroy
      @role = Role.find(params[:id])
      @role.destroy
      redirect_to root_path
    end
  
    private
  
    def role_params
        # require the :role table
        # security mesure called 'strong params' where we must permit
        # the different attributes (:name, :description) that you 
        # want to allow to be written to our database
        params.require(:role).permit(:name, :created_at);
    end
  
  end
  
  