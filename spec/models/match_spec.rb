require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many(:games) }
  it { should belong_to(:team1).class_name(Team).with_foreign_key("team1_id") }
  it { should belong_to(:team2).class_name(Team).with_foreign_key("team2_id") }

  it { should validate_length_of(:games) }

  describe "#update_winning_team_id" do
    let(:team1) { FactoryGirl.create(:team) }
    let(:team2) { FactoryGirl.create(:team) }

    let(:match) { FactoryGirl.create(:match, team1: team1, team2: team2) }
    let(:result) { match.winning_team_id }

    it { expect(match.games.size).to eq 1 }

    context "match with 1 game" do
      before { match.update_winning_team_id }
      it { expect(result).to be nil }
    end

    context "match with 2 game" do
      before { match.games = [game1, game2]; match.update_winning_team_id }

      context "1 win 1 loose" do
        let(:game1) { FactoryGirl.create(:game, score_team1: 10, score_team2: 2, team1: team1, team2: team2)}
        let(:game2) { FactoryGirl.create(:game, score_team1: 5, score_team2: 10, team1: team1, team2: team2)}

        it { expect(result).to be nil }
      end

      context "2 win" do
        let(:game1) { FactoryGirl.create(:game, score_team1: 10, score_team2: 2, team1: team1, team2: team2)}
        let(:game2) { FactoryGirl.create(:game, score_team1: 10, score_team2: 9, team1: team1, team2: team2)}

        it { expect(result).to eq team1.id }
      end
    end

    context "match with 3 game" do
      let(:team1) { FactoryGirl.create(:team) }
      let(:team2) { FactoryGirl.create(:team) }

      let(:games) { FactoryGirl.create_list(:game, 2, team1: team1, team2: team2, score_team1: 10, score_team2: 7)}
      let(:game1) { FactoryGirl.create(:game, score_team1: 7, score_team2: 10, team1: team1, team2: team2)}

      before { match.games = (games << game1); match.update_winning_team_id }
      it { expect(result).to eq team1.id }
    end
  end
end
