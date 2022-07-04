class TravelMemoryComment < ApplicationRecord
  belongs_to :travel_memory
  belongs_to :customer

  validates :comment, presence: true
end
