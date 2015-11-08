require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_and_belong_to_many(:users) }

  describe "#to_s" do
    let(:team) { FactoryGirl.build(:team, name: "Team#1") }

    subject { team.to_s }
    it { is_expected.to eq "Team#1" }
  end
end
