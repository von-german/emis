class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :patient_name
      t.string :doctor_name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
