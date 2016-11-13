class MpaaAddComment < ActiveRecord::Migration
  def change
    add_column :mpaas, :comment, :string
  end
end
