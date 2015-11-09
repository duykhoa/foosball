class Game < ActiveRecord::Base
  belongs_to :team1, class_name: Team, foreign_key: "team1_id"
  belongs_to :team2, class_name: Team, foreign_key: "team2_id"

  validates :team1, :team2, presence: true
  validates :score_team1, :score_team2,
    numericality: { greater_than: 0, less_than: 11, message: "Score must be in 0-10"}

  before_save :update_winning_team_id

  def update_winning_team_id
    return unless score_team1 == 10 || score_team2 == 10
    if score_team1 > score_team2
      self.winning_team_id = team1_id
    elsif score_team2 > score_team1
      self.winning_team_id = team2_id
    end
  end
end
