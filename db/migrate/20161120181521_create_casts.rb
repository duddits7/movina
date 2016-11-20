class CreateCasts < ActiveRecord::Migration[5.0]
  def change
    create_table :casts do |t|
      t.references :person, foreign_key: true
      t.references :movie, foreign_key: true
      t.references :rrole, foreign_key: true

      t.timestamps
    end
  end
end
