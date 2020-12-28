class Comment < Feedback
  has_many :likes, class_name: :Like, as: :likeable, dependent: :destroy
  scope :calculate_number_of_likes, -> { left_outer_joins(:likes).group('feedbacks.id').count('likes.likeable_id') }
  scope :where_by_ids, ->(comment_ids) { where('feedbacks.id in (?)', comment_ids) }
end
