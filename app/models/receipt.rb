class Receipt < ApplicationRecord
 belongs_to :container
 belongs_to :user
 #maybe comback later
 validates_presence_of :price, :items, :container_id, :user_id

 def prescription_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
 end
end
