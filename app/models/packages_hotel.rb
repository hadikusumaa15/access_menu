class PackagesHotel < ApplicationRecord
  belongs_to :hotel
  belongs_to :package
end
