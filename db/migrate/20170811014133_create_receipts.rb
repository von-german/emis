class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :price
      t.string :items
      t.references :container, index: true
      t.references :user, index: true
      t.boolean :read, :default => false    	
      t.timestamps
    end
  end
end
