class Menu < ApplicationRecord
    has_and_belongs_to_many :roles
    has_and_belongs_to_many :packages
    has_many :menus_packages

end
