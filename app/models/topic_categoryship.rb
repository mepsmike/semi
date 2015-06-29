class TopicCategoryship < ActiveRecord::Base
	has_many :Topics
	has_many :categories
end
