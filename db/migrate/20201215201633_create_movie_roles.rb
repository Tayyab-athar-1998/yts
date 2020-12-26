class CreateMovieRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_roles do |t|
      t.string :staring_as
      t.string :role_played

      t.timestamps
    end
  end
end
