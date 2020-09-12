class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

   	attachment :profile_image, destroy: false

  	validates :name, presence: true, length: { minimum: 2, maximum: 20 }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
