class V2::PackagesController < ApplicationController
    before_action :check_sign_in, except: :index
    
    def sql
        @id = 1
        @menus_packages = Menu.find_by_sql("SELECT menus.id, menus.name, menus_packages.menu_id, menus_packages.package_id 
        FROM menus 
        INNER JOIN menus_packages ON menus.id=menus_packages.menu_id")
    end

    def index
        sql
        @userNow = current_user.admin_type
        @packages = Package.all
        @package = Package.find_by_id(params[:id])
    end

    def show

    end
    
    def new
        @userNow = current_user.admin_type
        @package = Package.new
    end

    def create
        @menu_ids = []
        @userNow = current_user.admin_type
        @package = Package.new(package_params)
        menu_params.to_h.map {|m,i| @menu_ids.push(i) }
        if @package.save
            @menu_ids.each do |menu_id|
                @package.menus_packages.create(menu_id: menu_id)
            end
        redirect_to "/v2/packages"
        else
        render 'new'
        end
    end

    def edit
        
        index
        @package = Package.find_by_id(params[:id])
    end

    def update
        edit
        @menu_ids = []
        @menus_packages=MenusPackage.where(package_id: @package.id)
        menu_params.to_h.map {|m,i| @menu_ids.push(i) }
        if @package.update(package_params)
            @menus_packages.all.each do |x|
				x.destroy
            end
            
            @menu_ids.each do |menu_id|
                @package.menus_packages.create(menu_id: menu_id)
            end

            redirect_to v2_packages_path
        else
            redirect_to v2_packages_path
        end
    end
    def destroy
        @package = Package.find(params[:id])
        @package.destroy
        redirect_to "/v2/packages"
    end

    private
        
    def package_params
        params.require(:package).permit(:name, :id, :maxuser);
    end

    def menu_params
        params.require(:menu).permit!
        # params.require(:menu).permit(:POS, :CRS, :Add, :User, :Delete);
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
