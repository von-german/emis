class AddInfoToNurse < ActiveRecord::Migration[5.1]
  def change
    add_column :nurses, :email, :string
    add_column :nurses, :password, :string
    add_column :nurses, :password_digest, :string
  end
end
