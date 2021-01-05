module Mutations
  class Login < Mutations::BaseMutation
    graphql_name "SignIn"

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false

    def resolve(email: ,password:)
      user = User.find_for_database_authentication(email: email)

      if user.present?
        if user.valid_password?(password)
          context[:current_user] = user
          { user: user }
        else
          GraphQL::ExecutionError.new('Incorrect Email/Password')
        end
      else
        GraphQL::ExecutionError.new('User not registered on this application')
      end
    end
  end
end
