class ChangeDateFieldsMovies < ActiveRecord::Migration
  def change
    change_column :movies, :prod_date, :date
    change_column :movies, :dvd_date, :date
  end
end
