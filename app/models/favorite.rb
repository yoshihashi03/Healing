class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :blog

  validates :customer_id, uniqueness: { scope: :blog_id }
end
