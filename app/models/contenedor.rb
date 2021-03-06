class Contenedor < ApplicationRecord
	 belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
 belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

has_many :test_results, dependent: :destroy


scope :between, -> (sender_id,recipient_id) do
    where("(contenedors.sender_id = ? AND contenedors.recipient_id =?) OR
    (contenedors.sender_id = ? AND contenedors.recipient_id =?)",
    sender_id,recipient_id, recipient_id, sender_id)
 end

end
