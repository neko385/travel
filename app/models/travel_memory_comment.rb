class TravelMemoryComment < ApplicationRecord
  belongs_to :travel_memory
  belongs_to :customer

  validates :comment, presence: true

  scope :active, -> { joins(:customer).where(customer: {is_deleted: false}) }
end
