class PatientAuthorization < ActiveRecord::Base
  belongs_to :patient
end
