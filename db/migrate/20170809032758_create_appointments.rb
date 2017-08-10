class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_time
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
