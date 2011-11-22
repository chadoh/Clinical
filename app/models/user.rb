class User < ActiveRecord::Base
  belongs_to :organization
  has_many :patients

  # Sample SQL generated:
  # SELECT visits.*
  # FROM "patients"
  # INNER JOIN "patient_authorizations" ON "patient_authorizations"."patient_id" = "patients"."id"
  # INNER JOIN "visits" ON "visits"."patient_authorization_id" = "patient_authorizations"."id"
  # WHERE "patients"."user_id" = 123
  def visits
    # Please pardon the glaring LoD violation!
    self.patients.joins(:visits).select('visits.*').map(&:visits).flatten
  end

end
