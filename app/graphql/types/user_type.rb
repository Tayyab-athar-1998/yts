module Types
  class UserType < BaseObject
    description 'A user'

    field :id, ID, null: false
    field :user_name, String, null: false
    field :name, String, null: false
    field :introduction, String, null: false
    field :created_at, String, null: false
    field :capabilities, [String], null: false
    field :email, String, null: false
  end
end
