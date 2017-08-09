class CreateReceptionists < ActiveRecord::Migration[5.1]
  def change
    create_table :receptionists do |t|

      t.timestamps
    end
  end
end
