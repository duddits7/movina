class MoviesRenameCaptionToTitle < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.rename :caption, :title
      t.rename :orig_caption, :title_original
    end
  end
end
