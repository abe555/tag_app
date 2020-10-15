class Tag < ApplicationRecord
	has_many :tag_maps, dependent: :destory, foreign_key: 'tag_id'
	has_many :posts, through: :tag_maps
end