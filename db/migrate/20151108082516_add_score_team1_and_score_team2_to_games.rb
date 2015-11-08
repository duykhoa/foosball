class AddScoreTeam1AndScoreTeam2ToGames < ActiveRecord::Migration
  def change
    add_column :games, :score_team1, :integer
    add_column :games, :score_team2, :integer
  end
end
