class MoviesHasManyCoversAndFrames < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.remove :cover_id, :frame_id
    end
  end
end
