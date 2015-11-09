class AddWinningTeamIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :winning_team_id, :integer, default: 0
  end
end
