class Post < ApplicationRecord
   mount_uploader :attachment, AttachmentUploader
   validates :name, presence: true
   validates :content, presence: true

   belongs_to :user, optional: true
   has_many :taggings, dependent: :destroy
   has_many :tags, through: :taggings, source: :tag
   has_many :favorites, dependent: :destroy
   has_many :favorite_users, through: :favorites, source: :user
   has_many :comments, dependent: :destroy
   

   scope  :order_by_created_at, ->  {order(created_at: :desc)}
   scope  :title_search, -> (search_key){where("name LIKE ?","%#{search_key}%")}

   scope :tag_search, -> (search_tag){
        posts = Tagging.where(tag_id: search_tag)
        ids = posts.map{ |post| post.post_id } 
        where(id: ids)
    }
end
