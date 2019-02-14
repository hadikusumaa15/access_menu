class V2::HotelsUsersController < ApplicationController
    before_action :check_sign_in, except: :index
    
#-------------------------------------------------todo list DOWN HERE :------------------------------------------#
    # 1. getting params DONE
    # 2. filter params
    # 3. create roles
    # 4. create roles_menus
    # 5. redirect

#------------------------------------------------GLOBAL PARAMS AND VARIABLE :----------------------------------#
    def paramsr
        @hotel_id = params[:hotel_id]
        @id = params[:id]
        @role_id = params[:role_id]
    end

    def global
        #ini cara terbaik untuk sql query + joins
        @hotelsusers=User.select("users.id, users.email, hotels_users.user_id, hotels.name, hotels_users.hotel_id") 
        .joins("INNER JOIN hotels_users ON users.id = hotels_users.user_id 
        INNER JOIN hotels ON hotels_users.hotel_id = hotels.id")
    end
#---------------------------------------YOUR CODES DOWN HERE : --------------------------------------------------#
#---------------------------------------INDEX : -------------------------------------------------#
    def index
        paramsr
        global
    end
#---------------------------------------SHOW :-------------------------------------------------#
    def show
        paramsr
        global
    end
#---------------------------------------NEW :-------------------------------------------------#
    def new
        paramsr
        @hotels_user=HotelsUser.new
    end
#---------------------------------------NEW CREATE :-------------------------------------------------#
    def create
        paramsr
        @hotels_user=HotelsUser.new(hotels_user_params)
            if @hotels_user.save
                redirect_to "/v2/hotels_users"
            else
                render 'new'
            end
    end
#---------------------------------------EDIT UPDATE :-------------------------------------------------#

    def edit
        paramsr

    end

    def update
        paramsr
    end	
#---------------------------------------DESTROY :-------------------------------------------------#

    def destroy
        paramsr
            @hotels_user = HotelsUser.find_by_id(@id)
            @hotels_user.destroy
            redirect_to "/v2/hotels_users"
        end
#---------------------------------------STRONG PARAMS ONLY DOWN HERE :-----------------------------------------#
        private

    def hotels_user_params
        params.require(:hotels_user).permit(:hotel_id, :user_id)
    end

    def permit!
        each_pair do |key, value|
            convert_hashes_to_parameters(key, value)
            self[key].permit! if self[key].respond_to? :permit!
        end
        
        @permitted = true
        self
    end
    
end
