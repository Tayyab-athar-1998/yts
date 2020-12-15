class CreateVideoQualities < ActiveRecord::Migration[5.1]
  def change
    create_table :video_qualities do |t|
      t.integer :resolution

      t.timestamps
    end
  end
end
