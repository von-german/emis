class CreateHolders < ActiveRecord::Migration[5.1]
  def change
    create_table :holders do |t|
  	 t.integer :sender_id
  	 t.integer :recipient_id
     t.timestamps
    end
  end
end
