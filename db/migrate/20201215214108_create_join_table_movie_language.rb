class CreateJoinTableMovieLanguage < ActiveRecord::Migration[5.1]
  def change
    create_join_table :movies, :languages do |t|
      t.index [:movie_id, :language_id]
      t.index [:language_id, :movie_id]
    end
  end
end
