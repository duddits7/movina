class AddMpaaGenresToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :mpaa_id, :integer
    add_foreign_key :movies, :mpaas
    create_join_table :movies, :genres
    add_foreign_key :genres_movies, :movies
    add_foreign_key :genres_movies, :genres
  end
end
