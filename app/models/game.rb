class Game < ActiveRecord::Base
  belongs_to :team1, class_name: Team, foreign_key: "team1_id"
  belongs_to :team2, class_name: Team, foreign_key: "team2_id"
  belongs_to :winning_team, class_name: Team, foreign_key: "winning_team_id"

  validates :team1, :team2, presence: true
  validates :score_team1, :score_team2,
    numericality: { greater_than: 0, less_than: 11, message: "Score must be in 0-10"}

  before_save :update_winning_team_id

  # Public: Return all game that doesn't belongs to a match
  #
  # Example
  #
  #   Game.single
  #
  # Return
  #   An array of games
  def self.single
    joins("LEFT JOIN matches_games ON matches_games.game_id = games.id")
      .where("matches_games.match_id IS NULL")
  end

  # Internal: Update winning team id for game model
  #   It's a cache field, help finding the winner faster
  #
  #   This method will be trigger when a game is saved (create or update)
  #
  #   The winning_team_id is only updated when score reach to 10
  #
  # Example
  #
  #   Manually usage
  #
  #     game.update_winning_team_id
  #
  #   Automatically use
  #
  #     game.score_team1 = 10
  #     game.score_team2 = 9
  #     game.save! # => set the winning_team_id = team1_id
  def update_winning_team_id
    return unless score_team1 == 10 || score_team2 == 10
    if score_team1 > score_team2
      self.winning_team_id = team1_id
    elsif score_team2 > score_team1
      self.winning_team_id = team2_id
    end
  end
end
