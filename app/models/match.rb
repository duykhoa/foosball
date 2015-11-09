class Match < ActiveRecord::Base
  has_and_belongs_to_many :games, join_table: "matches_games"
  validates_length_of :games, maximum: 3, minimum: 2

  accepts_nested_attributes_for :games
end
