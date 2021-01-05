module Types
  class FeedbackType < BaseObject
    description 'A Feedback'

    field :content, String, null: false
    field :type, String, null: false
    
    field :user, Types::UserType, null: false
    field :movie, Types::MovieType, null: false
  end
end
