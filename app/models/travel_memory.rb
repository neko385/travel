class TravelMemory < ApplicationRecord
  belongs_to :customer
  has_many :travel_memory_comments,dependent: :destroy
  has_many :favorites,dependent: :destroy

  has_one_attached :image

  validates :place, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :latitude, presence: true


  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.search(keyword)
    if keyword != ""
      TravelMemory.where(["place like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
    else
      TravelMemory.all
    end
  end
end
