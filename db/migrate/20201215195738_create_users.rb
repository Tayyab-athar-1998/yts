class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :name
      t.string :password
      t.string :password_salt
      t.string :introduction
      t.string :email
      t.string :capabilities

      t.timestamps
    end
  end
end
