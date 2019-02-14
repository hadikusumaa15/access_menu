class HotelsRole < ApplicationRecord
    belongs_to :role
    belongs_to :hotel
end
