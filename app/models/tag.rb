class Tag < ApplicationRecord

  validates :name, presence: true
  
  #belongs_to :post, optional: true
  belongs_to :user, optional: true
  has_many :taggings, dependent: :destroy
  has_many :tagging_posts, through: :taggings, source: :post
end
