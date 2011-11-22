class Organization < ActiveRecord::Base
  has_many :users

  # Sample SQL generated:
  # SELECT "visits".*
  # FROM "visits"
  # INNER JOIN "patient_authorizations" ON "patient_authorizations"."id" = "visits"."patient_authorization_id"
  # INNER JOIN "patients" ON "patients"."id" = "patient_authorizations"."patient_id"
  # INNER JOIN "users" ON "users"."id" = "patients"."user_id"
  # WHERE "users"."organization_id" = 321
  def visits
    Visit.for_organization(self)
  end
end
