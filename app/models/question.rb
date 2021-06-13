class Question < ApplicationRecord
  belongs_to :user

  has_many :tag_maps, dependent: :destroy
  has_many :tag, through: :tag_maps

  validates :title, presence: true, length: { maximum: 100}
  validates :body, presence: true, length: { maximum: 500}
  validates :answer, presence: true, length: { maximum: 100}
  
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_question_tag = Tag.find_or_create_by(tag_name: new)
      self.question_tags << new_question_tag
    end
  end
end
