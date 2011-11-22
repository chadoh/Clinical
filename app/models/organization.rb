class Organization < ActiveRecord::Base
  has_many :users

  # Sample SQL generated:
  # SELECT visits.*
  # FROM "users"
  # INNER JOIN "patients" ON "patients"."user_id" = "users"."id"
  # INNER JOIN "patient_authorizations" ON "patient_authorizations"."patient_id" = "patients"."id"
  # INNER JOIN "visits" ON "visits"."patient_authorization_id" = "patient_authorizations"."id"
  # WHERE "users"."organization_id" = 321
  def visits
    # Please pardon the glaring LoD violation!
    self.users.joins(:patients => :visits).select('visits.*').map(&:visits).flatten
  end
end
