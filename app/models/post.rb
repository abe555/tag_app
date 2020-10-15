class Post < ApplicationRecord
  belongs_to :user

  has_many :tags, through: :tag_maps
  has_many :tag_maps. dependent: :destory
end
