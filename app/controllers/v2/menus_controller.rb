class V2::MenusController < ApplicationController
    before_action :check_sign_in, except: :index
	
#-------------------------------------------------todo list DOWN HERE :------------------------------------------#
	# 1. getting params DONE
	# 2. filter params
	# 3. create Menus
	# 4. create Menus_menus
	# 5. redirect

#------------------------------------------------GLOBAL PARAMS AND VARIABLE :----------------------------------#
	def paramsr
		@id = params[:id]
	end

	def global
		@menus=Menu.all
	end
#---------------------------------------YOUR CODES DOWN HERE : --------------------------------------------------#
#---------------------------------------INDEX : -------------------------------------------------#
	def index
		paramsr
		global
	end
#---------------------------------------SHOW :-------------------------------------------------#
	# 1. getting params DONE
	# 2. filter params DONE
	# 3. show Menus DONE
	# 4. show MENU DONE
	# 5. redirect DONE
	# 6. WAITING FOR EDIT
	def show
		paramsr
        global
            @menu=@menus.find_by_id(@id)
			if @menu.nil?
				redirect_to "/v2/menus/"
			end
	end
#---------------------------------------NEW :-------------------------------------------------#
	# 1. getting params DONE
	# 2. filter params 
	# 3. create MenuS 
	# 4. create MENUSMenu 
	# 5. redirect 
	# 6. WAITING FOR EDIT
	def new
		paramsr
		@menu=Menu.new
	end
#---------------------------------------NEW CREATE :-------------------------------------------------#
	def create
        new
		@menu=Menu.delay.create(menu_params)
	  if @menu.save
		flash[:success]="Creating Menu... wait a sec. delayed Job activated"
        redirect_to "/v2/menus/"
      else
        render 'new'
      end
  	end
#---------------------------------------EDIT UPDATE :-------------------------------------------------#

	def edit
		paramsr
        global
        @menu=@menus.find_by_id(@id)

	end

	def update
		edit   
		if @menu.update(menu_params)
			redirect_to "/v2/menus/#{menu.id}"
			else
			render 'edit'

		end

	end	
#---------------------------------------DESTROY :-------------------------------------------------#

	def destroy
        index
        p "---------------------------------------"
        p @id
            @menu = Menu.where(id: @id).first.destroy
            redirect_to "/v2/menus/"
	    end
#---------------------------------------STRONG PARAMS ONLY DOWN HERE :-----------------------------------------#
		private

	def menu_params
		params.require(:menu).permit(:name, :id);
	end
end
