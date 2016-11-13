class AddDvdDateToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :dvd_date, :datetime 
  end
end
