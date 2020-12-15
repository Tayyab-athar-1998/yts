class CreateJoinTableMovieVideoQuality < ActiveRecord::Migration[5.1]
  def change
    create_join_table :movies, :video_qualities do |t|
      t.index [:movie_id, :video_quality_id]
      t.index [:video_quality_id, :movie_id]
    end
  end
end
