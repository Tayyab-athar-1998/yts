class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :image, as: :imageable, dependent: :destroy
  has_many :feedback, dependent: :destroy
  has_many :movies_created, class_name: :Movie, inverse_of: 'created_by', dependent: :destroy

  has_many :ratings, dependent: :destroy
  
  has_many :movies, through: :likes, source: :likeable, source_type: 'Movie'
  has_many :comments, through: :likes, source: :likeable, source_type: 'Comment'
  
  validates :user_name, presence: true, uniqueness: true
  validates :name, presence: true
end
