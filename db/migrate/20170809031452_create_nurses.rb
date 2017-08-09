class CreateNurses < ActiveRecord::Migration[5.1]
  def change
    create_table :nurses do |t|

      t.timestamps
    end
  end
end
