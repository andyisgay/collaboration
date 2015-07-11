class Article < ActiveRecord::Base
	self.table_name = :posts
	belongs_to :user
end
