class Role < ApplicationRecord
    def updat
        sleep 10 # simulate long newsletter delivery
        update_attribute(:updated_at, Time.zone.now+11)
        # update_attribute(:name, "taufan")
      end
    
    has_many :admins
    has_and_belongs_to_many :menus
    has_many :menus_roles
    has_one :hotels



    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |product|
                csv << product.attributes.values_at(*column_names)
            end
        end
    end


    # belongs_to :users

    # belongs_to :admins
    # Role.where(id: 1).first.menus_roles.create(menu_id: 1)

#     Role.joins("LEFT JOIN menus_roles ON menus_roles.id=roles.id").joins("LEFT JOIN menus ON menus.id=menus_roles.menu_id").where(id: 1).first.name
#   Role Load (0.4ms)  SELECT  `roles`.* FROM `roles` LEFT JOIN menus_roles ON menus_roles.id=roles.id LEFT JOIN menus ON menus.id=menus_roles.menu_id WHERE `roles`.`id` = 1 ORDER BY `roles`.`id` ASC LIMIT 1
end
