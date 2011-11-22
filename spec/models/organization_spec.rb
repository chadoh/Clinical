require 'spec_helper'

describe Organization, "#visits" do
  let(:an_organization) { Organization.create! }
  let(:associated_user) { an_organization.users.create! }
  let(:associated_patient) { associated_user.patients.create! }
  let(:associated_patient_authorization) { associated_patient.patient_authorizations.create!  }
  let(:associated_visit) { associated_patient_authorization.visits.create! }

  let(:another_organization) { Organization.create! }
  let(:unassociated_user) { another_organization.users.create! }
  let(:unassociated_patient) { unassociated_user.patients.create! }
  let(:unassociated_patient_authorization) { unassociated_patient.patient_authorizations.create!  }
  let(:unassociated_visit) { unassociated_patient_authorization.visits.create! }

  subject { an_organization }

  its(:visits) { should include associated_visit }
  its(:visits) { should_not include unassociated_visit }
end
