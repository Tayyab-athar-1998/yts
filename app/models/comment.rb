class Comment < Feedback
  has_many :likes, class_name: :Like, as: :likeable, dependent: :destroy
end
