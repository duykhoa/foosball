require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many(:games) }
  it { should belong_to(:team1).class_name(Team).with_foreign_key("team1_id") }
  it { should belong_to(:team2).class_name(Team).with_foreign_key("team2_id") }

  it { should validate_length_of(:games) }

  describe "#update_winning_team_id" do
    let(:match) { FactoryGirl.create(:match) }
    it do
      expect(match.games.size).to eq 1
    end
  end
end
