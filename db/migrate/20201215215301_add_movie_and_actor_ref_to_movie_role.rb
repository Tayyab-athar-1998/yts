class AddMovieAndActorRefToMovieRole < ActiveRecord::Migration[5.1]
  def change
    add_reference :movie_roles, :movie, foreign_key: true
    add_reference :movie_roles, :actor, foreign_key: true
  end
end
