class Blog < ApplicationRecord

	belongs_to :customer
	has_many :blog_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	mount_uploaders :photos, PhotoUploader
	serialize :photos, JSON


	def favorited_by?(customer)
    	favorites.where(customer_id: customer.id).exists?
  	end

  	enum genre: {"犬": 0, "猫": 1, "鳥": 2, "その他": 3}

  	validates :photos, length: { maximum: 5 }

  	with_options presence: true do
  		validates :title
  		validates :body
  		validates :address
  	end



end
