class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :path

      t.timestamps null: false
    end
  end
end
