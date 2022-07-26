class Favorite < ApplicationRecord
  belongs_to :travel_memory
  belongs_to :customer

  scope :favorite, -> { joins(:customer).where(customer: {is_deleted: false}) }
end
