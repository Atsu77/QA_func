class Question < ApplicationRecord
  belongs_to :user

  has_many :tag_maps, dependent: :destroy
  has_many :tag, through: :tag_maps

  validates :title, presence: true, length: { maximum: 100}
  validates :body, presence: true, length: { maximum: 500}
  validates :answer, presence: true, length: { maximum: 100}
end
