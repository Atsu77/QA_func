class TagMap < ApplicationRecord
  belongs_to :question
  belongs_to :tag
  
  validates :post_id, presence: true
  validates :tag_id, presence: true
end
