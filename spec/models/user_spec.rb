require 'spec_helper'

describe User, "#visits" do
  let(:a_user) { User.create! }
  let(:associated_visits) { mock }

  subject { a_user }

  before do
    Visit.should_receive(:for_user).with(a_user) { associated_visits }
  end

  its(:visits) { should be associated_visits }
end
