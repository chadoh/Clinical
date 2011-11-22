class Visit < ActiveRecord::Base
  belongs_to :patient_authorization

  scope :for_organization, ->(organization) {
    joins(:patient_authorization => {:patient => :user}).
    where('users.organization_id' => organization)
  }

  scope :for_user, ->(user) {
    joins(:patient_authorization => :patient).
    where('patients.user_id' => user)
  }
end
