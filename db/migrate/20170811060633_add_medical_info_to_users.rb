class AddMedicalInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :b_pressure, :string
    add_column :users, :weight, :integer
    add_column :users, :height, :string
    add_column :users, :symptoms, :string
    add_column :users, :curr_condition, :string
  end
end
