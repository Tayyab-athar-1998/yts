class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.integer :likes_count

      t.timestamps
    end
  end
end
