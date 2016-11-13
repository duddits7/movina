class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
