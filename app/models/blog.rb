class Blog < ApplicationRecord

	belongs_to :customer
	has_many :blog_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
  has_many :blog_images, dependent: :destroy
  accepts_attachments_for :blog_images, attachment: :photo
  enum genre: {"犬": 0, "猫": 1, "鳥": 2, "その他": 3}
  default_scope -> { order(created_at: :desc) }

  with_options presence: true do
  	validates :title
  	validates :body
  	validates :address
  end

  def self.search_title(search)
      if search
        Blog.where(['name LIKE ?', "%#{search}%"])
      else
        Blog.all
      end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end




end
