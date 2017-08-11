class Container < ApplicationRecord
 belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
 belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

has_many :receipts, dependent: :destroy


scope :between, -> (sender_id,recipient_id) do
    where("(containers.sender_id = ? AND containers.recipient_id =?) OR
    (containers.sender_id = ? AND containers.recipient_id =?)",
    sender_id,recipient_id, recipient_id, sender_id)
 end

end
