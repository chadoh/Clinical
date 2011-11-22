require 'spec_helper'

describe Visit do
  let(:a_organization) { Organization.create! }
  let(:a_user) { a_organization.users.create! }
  let(:a_patient) { a_user.patients.create! }
  let(:a_patient_authorization) { a_patient.patient_authorizations.create!  }
  let(:a_visit) { a_patient_authorization.visits.create! }

  let(:b_organization) { Organization.create! }
  let(:b_user) { b_organization.users.create! }
  let(:b_patient) { b_user.patients.create! }
  let(:b_patient_authorization) { b_patient.patient_authorizations.create!  }
  let(:b_visit) { b_patient_authorization.visits.create! }

  describe ".for_organization" do
    subject { Visit.for_organization(a_organization) }

    it { should include a_visit }
    it { should_not include b_visit }
  end

  describe ".for_user" do
    subject { Visit.for_user(a_user) }

    it { should include a_visit }
    it { should_not include b_visit }
  end
end
