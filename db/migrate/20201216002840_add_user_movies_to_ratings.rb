class AddUserMoviesToRatings < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :user, foreign_key: true
    add_reference :ratings, :movie, foreign_key: true
  end
end
