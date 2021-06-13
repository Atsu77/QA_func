class Tag < ApplicationRecord
  has_many :tags, dependent: :destroy, foreign_key: :'tag_id'
  has_many :questions, through: :tag_maps
end
