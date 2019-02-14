class V2::ChotelsController < ApplicationController
	before_action :check_sign_in, except: :index
    def index
        @id = params[:id]
        @userNow = current_user.admin_type
        @chotels = Hotel.all
        @chotel = Hotel.find_by_id(params[:id])
    end

    def show

    end
    
    def new
        # index
        @userNow = current_user.admin_type
        @chotel = Hotel.new
    end

    def create
        @userNow = current_user.admin_type
        @chotel = Hotel.create(hotel_params)
      if @chotel.save
        redirect_to "/v2/chotels"
      else
        render 'new'
      end
    end

    def edit
        
        index
        @chotel = Hotel.find_by_id(params[:id])
        @hotel_id = params[:id]

    end

    def update
        edit
        if @chotel.update(hotel_params)
            @arr = []
            @package_id = []
            p "--------------------------------------------------"
            p hotelz_params.to_h.map {|m,i| @package_id.push(i) }
            p 'wowwwww'
            p @package_id[0]
            @menu_id = MenusPackage.where(package_id: @package_id[0]).each do |x| @arr.push(x.menu_id) end
            p @arr
            @role = Role.where(hotel_id: @hotel_id).each do |x| x.menus_roles.where.not(menu_id: @arr).each do |y| y.destroy end  end
            redirect_to v2_chotels_path
        else
            redirect_to v2_chotels_path
            # render 'edit'
        end
    end
    
    def destroy
        @chotel = Hotel.find(params[:id])
        @chotel.destroy
        redirect_to "/v2/chotels"
    end

	private
        
	def hotel_params
		# require the :user table
		# security mesure called 'strong params' where we must permit
		# the different attributes (:name, :description) that you 
		# want to allow to be written to our database
		params.require(:hotel).permit(:name, :package_id);
    end
    def hotelz_params
		# require the :user table
		# security mesure called 'strong params' where we must permit
		# the different attributes (:name, :description) that you 
		# want to allow to be written to our database
		params.require(:hotel).permit(:package_id);
	end
end
