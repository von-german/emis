class CreateContainers < ActiveRecord::Migration[5.1]
  def change
    create_table :containers do |t|
  	 t.integer :sender_id
  	 t.integer :recipient_id
     t.timestamps
    end
  end
end
