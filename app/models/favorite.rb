class Favorite < ApplicationRecord
  belongs_to :travel_memory
  belongs_to :favorite
end
