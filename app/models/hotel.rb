class Hotel < ApplicationRecord
    def self.create(id)
        find(id).create
      end
    
    def create
    sleep 10 # simulate long newsletter delivery
    update_attribute(:updated_at, Time.zone.now)
    end
    has_one :package
    # has_many :packages, through: :packages_hotels

    has_and_belongs_to_many :admins
    has_and_belongs_to_many :users
    has_many :hotels_users
    has_many :roles

end
