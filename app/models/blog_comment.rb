class BlogComment < ApplicationRecord
  belongs_to :customer
  belongs_to :blog

  validates :comment, presence: true, length: { maximum: 50 }
end
