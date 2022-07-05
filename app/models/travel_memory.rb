class TravelMemory < ApplicationRecord
  belongs_to :customer
  has_many :travel_memory_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  has_one_attached :image

  validates :place, presence: true
  validates :introduction, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
