class Match < ActiveRecord::Base
  has_and_belongs_to_many :games, join_table: "matches_games"

  belongs_to :team1, class_name: Team, foreign_key: "team1_id"
  belongs_to :team2, class_name: Team, foreign_key: "team2_id"

  validates_length_of :games, maximum: 3

  accepts_nested_attributes_for :games

  before_save :update_winning_team_id

  def update_winning_team_id
    return if games.size < 2

    if games.size == 2
      if games[0].winning_team_id == games[1].winning_team_id
        self.winning_team_id = games[0].winning_team_id
      end
    else
      winning_team_ids = games.pluck(:winning_team_id)
      if winning_team_ids.count(team1_id) > winning_team_ids.count(team2_id)
        self.winning_team_id = team1_id
      else
        self.winning_team_id = team2_id
      end
    end
  end
end
