class CreateMpaas < ActiveRecord::Migration
  def change
    create_table :mpaas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
