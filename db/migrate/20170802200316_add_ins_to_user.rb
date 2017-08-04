class AddInsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ins, :string
  end
end
