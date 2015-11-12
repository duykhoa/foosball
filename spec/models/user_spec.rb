require 'rails_helper'

describe User do
  describe "#to_s" do
    let(:user) { FactoryGirl.build(:user, first_name: "Kevin") }
    subject { user.to_s }

    it { is_expected.to eq "Kevin" }
  end
end
