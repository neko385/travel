class TravelMemory < ApplicationRecord
  belongs_to :customer
  has_many :travel_memory_comments
  has_many :favorites
end
