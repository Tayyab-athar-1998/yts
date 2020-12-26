class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :value

      t.timestamps
    end
  end
end
