class AddInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :emer_contact_name, :string
    add_column :users, :emer_contact_phone, :string
    add_column :users, :ssn, :string
    add_column :users, :phone_number, :string
  end
end
