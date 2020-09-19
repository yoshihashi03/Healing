class BlogImage < ApplicationRecord
	belongs_to :blog
	attachment :photo

 end
