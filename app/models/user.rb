class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :name, presence: true

  scope  :order_by_created_at, ->  {order(created_at: :desc)}
  scope  :order_by_status,  ->  (status){where(status: status)}
  scope  :title_search, -> (search_key){where("name LIKE ?","%#{search_key}%")}

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


         enum status: {
          Elève: 0,
        Etudiant: 1,
        Enseignant: 2
        }
end
