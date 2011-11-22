class User < ActiveRecord::Base
  belongs_to :organization
  has_many :patients

  # Sample SQL generated:
  # SELECT "visits".*
  # FROM "visits"
  # INNER JOIN "patient_authorizations" ON "patient_authorizations"."id" = "visits"."patient_authorization_id"
  # INNER JOIN "patients" ON "patients"."id" = "patient_authorizations"."patient_id"
  # WHERE "patients"."user_id" = 123
  def visits
    Visit.for_user(self)
  end

end
