module Mutations
  class UpdateLike < Mutations::BaseMutation
    argument :likeable_id, Int, required: true
    argument :likeable_type, String, required: true 

    field :is_successful, Boolean, null: false

    def resolve(likeable_id:, likeable_type:)
      current_user = User.find 1

      like = Like.where(
        'likeable_id = :likeable_id AND likeable_type = :likeable_type AND user_id = :user_id',
        { likeable_id: likeable_id, likeable_type: likeable_type, user_id: current_user.id }
      )

      if like.empty?
        Like.create(likeable_id: likeable_id, likeable_type: likeable_type, user_id: current_user.id)
      else
        like[0].destroy
      end
      { is_successful: true }
    end
  end
end
