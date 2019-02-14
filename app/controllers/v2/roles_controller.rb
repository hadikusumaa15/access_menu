class V2::RolesController < ApplicationController
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
		@package_id = Hotel.where(id: @hotel_id).first.package_id
	end

	def global
		@roles=user_hotels.where(id: @hotel_id).first.roles.all
	end
#---------------------------------------YOUR CODES DOWN HERE : --------------------------------------------------#
#---------------------------------------INDEX : -------------------------------------------------#
	def index
		paramsr
		global
		# render json: @roles, each_serializer: RoleSerializer, root: false
	end
#---------------------------------------SHOW :-------------------------------------------------#
	# 1. getting params DONE
	# 2. filter params DONE
	# 3. show roles DONE
	# 4. show MENU DONE
	# 5. redirect DONE
	# 6. WAITING FOR EDIT
	def show
		paramsr
		global
		@menu_ids=[]
		@role=@roles.find(@id)
		# render json: @role, each_serializer: RoleSerializer, root: false
		# respon_to do |format|
		# 	format.html
		# 	format.json { render json: @role }
		# end

		@menu_id=MenusRole.where(role_id: @id)
		@menu_id.all.each do |m| @menu_ids.push(m.menu_id) end
		@menu=Menu.where(id: @menu_ids)
			if @role.nil?
				redirect_to "/v2/hotels/#{@hotel_id}/roles/"
			end
	end
#---------------------------------------NEW :-------------------------------------------------#
	# 1. getting params DONE
	# 2. filter params 
	# 3. create ROLES 
	# 4. create MENUSROLE 
	# 5. redirect 
	# 6. WAITING FOR EDIT
	def new
		paramsr

		# @arr = []
		# @roles=user_hotels.where(id: @hotel_id).first.roles.all
		@role=Role.new
		@menu=Menu.find_by_sql("SELECT menus.name, menus.id, menus_packages.menu_id FROM menus_packages INNER JOIN menus ON menus.id=menus_packages.menu_id WHERE package_id = #{@package_id} ")
		@menu_ids = []

		# @package_id = Hotel.where(id: @hotel_id).first.package_id
		# @menu_id=MenusPackage.where(package_id: 2) #@package_id)
		# @menu_id.each do |m|
		# 	@arr=@arr.push(m.menu_id)
		# end
		# @menus=Menu.find_by_sql("SELECT menus.name, menus.id, menus_packages.menu_id FROM menus_packages INNER JOIN menus ON menus.id=menus_packages.menu_id WHERE package_id = #{@package_id}")
		# @sql = "SELECT menus.name, menus_packages.menu_id FROM menus_packages INNER JOIN menus ON menus.id=menus_packages.menu_id WHERE package_id = #{@package_id}"
 		# @menu_id = ActiveRecord::Base.connection.execute(@sql).to_s
		# @menu_id=MenusPackage.find_by_sql("SELECT menus.name, menus_packages.menu_id FROM menus_packages INNER JOIN menus ON menus.id=menus_packages.menu_id WHERE package_id = #{@package_id}")
		# @menus_package = MenusPackage.where(package_id: @package_id)
		# @menu_name

	end
#---------------------------------------NEW CREATE :-------------------------------------------------#
	def create
		# paramsr
		new
		aray = []
		p "wkwkwkwkwkwkwkwkwkwkwkwkwkwxxxkwkwkwk"
		params[:role].each do |x| 
			p x[:name]
			# aray.push(x[1])
		end
		# params[:role]
		p "----------------------------xxx-"
		# p "wkwkwWOAOSDOAJSDIPJAPOSDkwkwkwkwkwkwkwkwkwkwkwkwkwkwk"
		menu_params.to_h.map {|m,i| @menu_ids.push(i) }
        # @userNow = current_user.admin_type
		# @role=Role.create(params[:role].permit(:name, :hotel_id))
		# @role=Role.create(params[:role].permit!

		#No strong params :
		@role=Role.create(name: aray[0], hotel_id: aray[1].to_i)
		# @menus_role= MenusRole.new(menus_roles_params)
				# @menu=MenusRole.new
	  if @role.save
		# @menus_role.save
		p menu_params
		p @menu_ids
		p @menu
		if @menu_ids != []
			@menu_ids.each do |menu_id|
				@role.menus_roles.create(menu_id: menu_id)
			end
		end
        redirect_to "/v2/hotels/#{@hotel_id}/roles/"
      else
        render 'new'
      end
  	end
#---------------------------------------EDIT UPDATE :-------------------------------------------------#

	def edit
		paramsr
		@role=Role.find_by_id(@id)
		@menu=Menu.find_by_sql("SELECT menus.name, menus.id, menus_packages.menu_id FROM menus_packages INNER JOIN menus ON menus.id=menus_packages.menu_id WHERE package_id = #{@package_id} ")
		@menu_ids = []
		#kalo bingung coba di rails c
		@menus_role = MenusRole.where(role_id: @id).pluck(:menu_id)
	end

	def update
		paramsr
		@role=Role.find_by_id(@id)
		@menu_ids = [] 
		@menrol=MenusRole.where(role_id: @id)


		# Number.update(1, :number => 0)
		
		# @number.update
		# if Number.first.number == 0
			menu_params.to_h.map {|m,i| @menu_ids.push(i) }
			# Number.update(1, :number => 0)
		# end

		if @role.update(role_params)
			@menrol.all.each do |x|
				x.destroy
			end
			if @menu_ids != []
				@menu_ids.each do |menu_id|
					@role.menus_roles.create(menu_id: menu_id)
				end
			end
			redirect_to "/v2/hotels/#{@hotel_id}/roles/#{@id}"
			# redirect_to root_path
			else
			render 'edit'
			#   redirect_to root_path

		end

	end	
#---------------------------------------DESTROY :-------------------------------------------------#

	def destroy
		paramsr
			@role = Role.find_by_id(@id)
			@role.destroy
			redirect_to "/v2/hotels/#{@hotel_id}/roles"
	 end
#---------------------------------------STRONG PARAMS ONLY DOWN HERE :-----------------------------------------#
		private

	def hotels_roles_params
		params.require(:hotels_roles).permit(:hotel_id, :role_id)
	end

	def role_params
		# params.require(:role).permit(:name, :created_at, :hotel_id)
	end

	def menus_roles_params
		params.require(:menus_role).permit(:menu_id, :role_id)
	end

	def hotels_roles_params
		params.require(:hotels_roles).permit(:hotel_id, :role_id)
	end

	def menu_params
		if !params[:menu].nil?	
			params.require(:menu).permit!
			# params.require(:menu).permit(:POS, :CRS, :User, :Add, :Delete)
		end
	end

	def number_params
		params.require(:number).permit(:number)
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