class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :image, as: :imageable
  has_many :feedback
  has_many :movies_created, class_name: :Movie, inverse_of: 'created_by'

  has_many :ratings
  
  has_many :movies, through: :likes, source: :likeable, source_type: 'Movie'
  has_many :comments, through: :likes, source: :likeable, source_type: 'Comment'
end
