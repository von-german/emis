class AddInfoToReceptionist < ActiveRecord::Migration[5.1]
  def change
    add_column :receptionists, :name, :string
    add_column :receptionists, :email, :string
    add_column :receptionists, :password_digest, :string
  end
end
