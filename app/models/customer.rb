class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :travel_memories, dependent: :destroy
  has_many :travel_memory_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # 自分がフォローされる側
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分がフォローする側
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  # バリデーション
  validates :screen_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :email, presence: true


  # フォローした時の処理
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォローを外す時の処理
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end


  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(screen_name: 'guestuser', email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.screen_name = "guestuser"
      customer.last_name = "ゲスト"
      customer.first_name = "太郎"
      customer.last_kana = "ゲスト"
      customer.first_kana = "タロウ"
    end
  end

  def self.search(keyword)
    if keyword != ""
      Customer.where(["screen_name like?", "%#{keyword}%"])
    else
      Customer.all
    end
  end
end
