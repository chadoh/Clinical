require 'spec_helper'

describe User, "#visits" do
  let(:a_user) { User.create! }
  let(:associated_patient) { a_user.patients.create! }
  let(:associated_patient_authorization) { associated_patient.patient_authorizations.create!  }
  let(:associated_visit) { associated_patient_authorization.visits.create! }

  let(:another_user) { User.create! }
  let(:unassociated_patient) { another_user.patients.create! }
  let(:unassociated_patient_authorization) { unassociated_patient.patient_authorizations.create!  }
  let(:unassociated_visit) { unassociated_patient_authorization.visits.create! }

  subject { a_user }

  its(:visits) { should include associated_visit }
  its(:visits) { should_not include unassociated_visit }
end
