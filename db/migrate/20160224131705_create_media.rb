class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :movie_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
    add_index :media, :movie_id
  end
end
