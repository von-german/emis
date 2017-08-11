class Receipt < ApplicationRecord
 belongs_to :container
 belongs_to :user

 validates_presence_of :price, :items, :container_id, :user_id

 def receipt_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
 end
end
