class CreateRroles < ActiveRecord::Migration[5.0]
  def change
    create_table :rroles do |t|
      t.string :title

      t.timestamps
    end
  end
end
