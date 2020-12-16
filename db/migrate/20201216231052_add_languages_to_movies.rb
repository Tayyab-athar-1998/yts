class AddLanguagesToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :languages, :text
  end
end
