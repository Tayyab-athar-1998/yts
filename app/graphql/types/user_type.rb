module Types
  class UserType < BaseObject
    description 'A user'

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :id, ID, null: false
    field :user_name, String, null: false
    field :name, String, null: false
    field :introduction, String, null: false
    field :created_at, String, null: false
    field :capabilities, [String], null: false
    field :email, String, null: false

    # field :authentication_token, String, null: false
    # def authentication_token
    #   puts object.inspect
    #   # if object.gql_id != context[:current_user]&.gql_id
    #   #   raise GraphQL::UnauthorizedFieldError,
    #   #         "Unable to access authentication_token"
    #   # end

    #   object.authentication_token
    # end
  end
end
