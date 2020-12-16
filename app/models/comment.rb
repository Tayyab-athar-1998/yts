class Comment < Feedback
  has_many :likes, class_name: :Like, as: :likeable
end
