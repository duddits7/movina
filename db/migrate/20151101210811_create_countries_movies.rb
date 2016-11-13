class CreateCountriesMovies < ActiveRecord::Migration
  def change
    create_join_table :movies, :countries
    add_foreign_key :countries_movies, :movies
    add_foreign_key :countries_movies, :countries
  end
end
