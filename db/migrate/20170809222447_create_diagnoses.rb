class CreateDiagnoses < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnoses do |t|
      t.string :prescription
      t.string :condition
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
