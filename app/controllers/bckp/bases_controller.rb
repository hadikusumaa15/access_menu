class BasesController < ApplicationController
   def index
    # @package = Package.find(params[:name])
    # params.permit(:id, :name)
    @packages=Package.all
    @hotels=Hotel.all
    @admins=Admin.all
    @adminsHotels=AdminsHotel.all
    @menus=Menu.all
    @menusRoles=MenusRole.all
    @roles=Role.all
    @packagesHotels=PackagesHotel.all
    @users=User.all
    @hotelsusers=HotelsUser.all

   end

   def create
    response = {}
    package = Package.new(package_params)
    if package.save
        # UserMailer.registration_confirmation(@user).deliver
        response = package
        redirect_to 'http://rubyonrails.org'
    else
        response = {
            error: 'Error happen'
        }
    end
    render json: response 
   end

#    def choose_menu

#    end

#    def edit

#    end

#    def admin_saksak_e
#     Admin.saksak_e
#    end

# def create
#     # find Auction related to new Bid
#     @auction = Auction.find(params[:auction_id])
#     @bid = @auction.bids.create(bid_params)
#     @bid.user_id = current_user.id
#     # Find the bidder within User Table
#     @bidder = User.find(@bid.user_id)
#     @bid.save
#     redirect_to auction_path(@auction), :notice => "Bid placed"
#   end



   def indux
    # @package = Package.find(params[:name])
    # params.permit(:id, :name)
    @packages=Package.all
    @hotels=Hotel.all
    @admins=Admin.all
    @adminsHotels=AdminsHotel.all
    @menus=Menu.all
    @menusRoles=MenusRole.all
    @roles=Role.all
    @packagesHotels=PackagesHotel.all
    @users=User.all
   end

   def super
    indux
   end

   def hotelList
    indux
    @user=current_user
    @hotel=HotelsUser.find_by_sql("SELECT hotel_id FROM hotels_users WHERE user_id = 5")
    

   end
end
