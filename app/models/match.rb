class Match < ActiveRecord::Base
  has_and_belongs_to_many :games, join_table: "matches_games"
  belongs_to :winning_team, foreign_key: "winning_team_id", class_name: Team

  belongs_to :team1, class_name: Team, foreign_key: "team1_id"
  belongs_to :team2, class_name: Team, foreign_key: "team2_id"

  validates_length_of :games, maximum: 3

  accepts_nested_attributes_for :games

  before_save :update_winning_team_id

  # Internal: Update winning team id
  #   It's a caching column to keep track the winner team for each match
  #
  #   A match requires at least 2 games
  #   If a team wins 2 games, consider they are win, it works for both 3 & 2 games
  #   If the number of winning & losing are same, can't define the winner yet (for 2 games case)
  #
  #   Will be triggered when match is save (create or update)
  #
  # Example
  #
  #    Manually update:
  #      match.update_winning_team_id
  #
  #    Update by save
  #      match.games.create(game_params) # create a game
  #      match.save
  def update_winning_team_id
    return if games.size < 2

    winning_team_ids = games.pluck(:winning_team_id)

    if winning_team_ids.count(team1_id) > winning_team_ids.count(team2_id)
      self.winning_team_id = team1_id
    elsif winning_team_ids.count(team1_id) < winning_team_ids.count(team2_id)
      self.winning_team_id = team2_id
    end
  end
end
