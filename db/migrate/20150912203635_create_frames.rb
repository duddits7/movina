class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :path

      t.timestamps null: false
    end
  end
end
