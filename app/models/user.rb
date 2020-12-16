class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :image, as: :imageable
  has_many :feedback
  has_many :movies, through: :feedback
  has_many :movies_created, class_name: :Movie, inverse_of: 'created_by'

  has_many :ratings
  has_many :rated_movies, through: :feedback, class_name: :Movie

  validates :user_name, presence: true, uniqueness: true
  validates :name, presence: true
end
