json.extract! appointment, :id, :patient_name, :doctor_name, :start_time, :end_time, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
