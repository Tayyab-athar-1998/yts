module Mutations
  class UpdateComment < Mutations::BaseMutation
    argument :content, String, required: true
    argument :comment_id, Int, required: true

    field :is_successful, Boolean, null: false

    def resolve(content:, comment_id:)
      current_user = User.find 1

      review = Comment.find comment_id
      if review.user != current_user:
        # returning false since current user is not the owner of the comment
        # will raise proper error once auth is setup with graphql
        { is_successful: false}
      result = review.update_attributes(content: content)
      { is_successful: result }
    end
  end
end
