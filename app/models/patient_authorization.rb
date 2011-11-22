class PatientAuthorization < ActiveRecord::Base
  belongs_to :patient
  has_many :visits
end
