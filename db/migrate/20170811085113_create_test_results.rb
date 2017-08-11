class CreateTestResults < ActiveRecord::Migration[5.1]
  def change
    create_table :test_results do |t|
      t.string :test_type
      t.string :test_info 
      t.references :contenedor, index: true
      t.references :user, index: true
      t.boolean :read, :default => false    
      t.timestamps
    end
  end
end
