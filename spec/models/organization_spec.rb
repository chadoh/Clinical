require 'spec_helper'

describe Organization, "#visits" do
  let(:an_organization) { Organization.create! }
  let(:associated_visits) { mock }

  subject { an_organization }

  before do
    Visit.should_receive(:for_organization).with(an_organization) { associated_visits }
  end

  its(:visits) { should be associated_visits }
end
