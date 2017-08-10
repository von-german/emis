class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
     	t.string :drug
     	t.string :condition
      t.references :holder, index: true
      t.references :user, index: true
      t.boolean :read, :default => false    	
      t.timestamps
    end
  end
end
