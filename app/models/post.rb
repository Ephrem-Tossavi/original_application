class Post < ApplicationRecord
   mount_uploader :attachment, AttachmentUploader
   validates :name, presence: true

   scope  :order_by_created_at, ->  {order(created_at: :desc)}
   scope  :title_search, -> (search_key){where("name LIKE ?","%#{search_key}%")}
end
