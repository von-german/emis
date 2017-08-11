class TestResult < ApplicationRecord
 belongs_to :contenedor
 belongs_to :user

 validates_presence_of :test_type, :test_info, :contenedor_id, :user_id

 def prescription_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
 end
end
