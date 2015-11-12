require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:team1).class_name(Team).with_foreign_key("team1_id") }
  it { should belong_to(:team2).class_name(Team).with_foreign_key("team2_id") }
  it { should validate_presence_of(:team1) }
  it { should validate_numericality_of(:score_team1).with_message("Score must be in 0-10") }
  it { should validate_numericality_of(:score_team2).with_message("Score must be in 0-10") }

  describe "#update_winning_team_id" do
    before { game.update_winning_team_id }

    context "team1 win" do
      let(:game) { FactoryGirl.build(:game, score_team1: 10, score_team2: 5)}
      it { expect(game.winning_team_id).to eq game.team1.id }
    end

    context "save game" do
      let(:game) { FactoryGirl.build(:game, score_team1: 10, score_team2: 5)}
      it do
        game.save!
        expect(game.persisted?).to be true
        expect(game.winning_team_id).not_to be nil
      end
    end

    context "team2 win" do
      let(:game) { FactoryGirl.build(:game, score_team1: 2, score_team2: 10)}
      it { expect(game.winning_team_id).to eq game.team2.id }
    end

    context "no win" do
      let(:game) { FactoryGirl.build(:game, score_team1: 2, score_team2: 5)}
      it { expect(game.winning_team_id).to be nil }
    end

    context "save successfully" do
      let(:game) { FactoryGirl.build(:game, score_team1: 2, score_team2: 5)}

      it do
        game.save!
        expect(game.persisted?).to be true
        expect(game.winning_team_id).to be nil
      end
    end
  end

  describe "#single" do
    let!(:game) { FactoryGirl.create(:game) }

    context "all single game" do
      it { expect(Game.single).to include game }
    end

    context "exclude match's game" do
      let(:match) { FactoryGirl.create(:match) }
      it { expect(Game.single).to include game }
      it { expect(Game.single.count).to eq 1 }
    end
  end
end
