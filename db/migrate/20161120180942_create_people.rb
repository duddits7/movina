class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name_r
      t.string :middle_name_r
      t.string :last_name_r
      t.string :first_name_o
      t.string :middle_name_o
      t.string :last_name_o
      t.text :bio
      t.integer :height
      t.date :birth
      t.date :death
      t.integer :movie_count

      t.timestamps
    end
  end
end
