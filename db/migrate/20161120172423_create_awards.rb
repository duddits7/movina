class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.string :name
      t.string :category
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
