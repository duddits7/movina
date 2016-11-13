class AddMovieRefToCovers < ActiveRecord::Migration
  def change
    add_reference :covers, :movie, index: true, foreign_key: true
  end
end
