class Patient < ActiveRecord::Base
  belongs_to :user
  has_many :patient_authorizations
  has_many :visits, :through => :patient_authorizations
end
