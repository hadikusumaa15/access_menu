class Admin < ApplicationRecord
    has_and_belongs_to_many :hotels
    # belongs_to :role
    # has_one :role

    def self.saksak_e
        #telat terus
        #ga pernah makan siang
    end
end
