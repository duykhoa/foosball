require 'rails_helper'

describe Stat do
  let(:team1) { FactoryGirl.create(:team) }
  let(:team2) { FactoryGirl.create(:team) }

  let!(:games) { FactoryGirl.create_list(:game, 2, team1: team1, team2: team2, score_team1: 10, score_team2: 5) }

  describe "#best_team" do
    subject { Stat.new.best_team }
    it { expect(subject.first.winning_team_id).to eq team1.id }
    it { expect(subject.first.num_wins).to eq 2 }

    context "more teams" do
      let(:team3) { FactoryGirl.create(:team)}
      let!(:different_games) { FactoryGirl.create_list(:game, 1, team1: team3, team2: team1, score_team1: 10, score_team2: 5) }

      it { expect(subject.first.winning_team_id).to eq team1.id }
      it { expect(subject.first.num_wins).to eq 2 }
    end
  end

  describe "#count_win" do
    let(:user) { FactoryGirl.create(:user) }
    let(:team1) { FactoryGirl.create(:team, users: [user]) }
    subject { Stat.new.count_win }

    it { expect(subject.first.user_id).to eq(user.id) }
    it { expect(subject.first.num_wins).to eq(2) }
  end

  describe "#total_game" do
    let(:user) { FactoryGirl.create(:user) }
    let(:team1) { FactoryGirl.create(:team, users: [user]) }
    subject { Stat.new.total_game }

    it { expect(subject.first.user_id).to eq(user.id) }
    it { expect(subject.first.total_games).to eq(2) }

    context "include loose game" do
      let!(:different_games) { FactoryGirl.create_list(:game, 1, team1: team1, team2: team2, score_team1: 10, score_team2: 5) }
      it { expect(subject.first.user_id).to eq(user.id) }
      it { expect(subject.first.total_games).to eq(3) }
    end
  end
end
