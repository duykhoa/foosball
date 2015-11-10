class Match < ActiveRecord::Base
  has_and_belongs_to_many :games, join_table: "matches_games"

  belongs_to :team1, class_name: Team, foreign_key: "team1_id"
  belongs_to :team2, class_name: Team, foreign_key: "team2_id"

  validates_length_of :games, maximum: 3

  accepts_nested_attributes_for :games

  before_save :update_winning_team_id

  def update_winning_team_id
  end
end
