module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end

    field :add_movie, mutation: Mutations::AddMovie, description: 'Add a new movie'
    field :update_movie, mutation: Mutations::UpdateMovie, description: 'Update an existing movie'
    field :update_like, mutation: Mutations::UpdateLike, description: 'Update a like'
    field :update_reviews, mutation: Mutations::UpdateReview, description: 'Update or create a review'
    field :add_new_comment, mutation: Mutations::CreateComment, description: 'New comment'
    field :update_comment, mutation: Mutations::UpdateComment, description: 'Update comment'
    field :login, mutation: Mutations::Login, description: 'Login'
  end
end
