class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :number_of_downloads
      t.date :release_date
      t.boolean :is_featured
      t.text :synopsis

      t.timestamps
    end
  end
end
