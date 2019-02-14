class AdminsHotel < ApplicationRecord
  belongs_to :admin
  belongs_to :hotel
  belongs_to :user
  belongs_to :role
  belongs_to :package
end
