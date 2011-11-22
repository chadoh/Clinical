class Visit < ActiveRecord::Base
  belongs_to :patient_authorization
  has_one :patient, through: :patient_authorization
  has_one :user,    through: :patient

  scope :for_organization, ->(organization) {
    joins(:user).
    where('users.organization_id' => organization)
  }

  scope :for_user, ->(user) {
    joins(:patient_authorization => :patient).
    where('patients.user_id' => user)
  }
end
