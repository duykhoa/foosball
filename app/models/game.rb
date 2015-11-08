class Game < ActiveRecord::Base
  belongs_to :team1, class_name: Team, foreign_key: "team1_id"
  belongs_to :team2, class_name: Team, foreign_key: "team2_id"

  validates :team1, :team2, presence: true
end
