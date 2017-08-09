class Doctor < Nurse
  def set_default_role
    self.role ||= :doctor
  end
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
