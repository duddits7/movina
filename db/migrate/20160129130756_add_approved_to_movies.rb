class AddApprovedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :approved, :boolean, default: false
  end
end
