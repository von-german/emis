class CreateTestResults < ActiveRecord::Migration[5.1]
  def change
    create_table :test_results do |t|
      t.string :test_type
      t.string :test_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
