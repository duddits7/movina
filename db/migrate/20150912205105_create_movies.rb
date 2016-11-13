class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :caption
      t.string :orig_caption
      t.text :description
      t.datetime :prod_date
      t.datetime :post_date
      t.integer :cover_id
      t.integer :frame_id

      t.timestamps null: false
    end
  end
end
