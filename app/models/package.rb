class Package < ApplicationRecord
    has_many :hotels
    has_and_belongs_to_many :menus
    has_many :menus_packages
  end