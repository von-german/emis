class Prescription < ApplicationRecord
 belongs_to :holder
 belongs_to :user
 #maybe comback later
 validates_presence_of :drug,:condition, :holder_id, :user_id

 def prescription_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
 end

end
