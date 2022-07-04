class TravelMemory < ApplicationRecord
  belongs_to :customer
  has_many :travel_memory_comments
  has_many :favorites

  has_one_attached :image

  validates :place, presence: true
  validates :introduction, presence: true
end
