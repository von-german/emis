class User < ApplicationRecord
  has_many :test_results
  has_many :diagnoses
  has_many :appointments
  has_many :diagnoses
  enum role: [:user, :receptionist, :nurse, :doctor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end

  def upcoming_appointments
    appointments.order(appointment_time: :desc).select { |a| a.appointment_time > (DateTime.now) }
  end

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :conversations, :foreign_key => :sender_id
end
