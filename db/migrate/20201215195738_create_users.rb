class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :name
      t.string :introduction
      t.string :capabilities

      t.timestamps
    end
  end
end
