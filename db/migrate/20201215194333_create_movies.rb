class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :number_of_downloads
      t.date :release_date
      t.boolean :is_featured
      t.text :synopsis
      t.string :video_quality
      t.string :languages
      t.string :genres
      t.integer :feedbacks_count
      t.integer :likes_count

      t.timestamps
    end

    add_index :movies, :name
    add_index :movies, :release_date
    add_index :movies, :is_featured
    add_index :movies, :video_quality
    add_index :movies, :number_of_downloads
    add_index :movies, :languages
    add_index :movies, :genres
  end
end
