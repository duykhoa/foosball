class AddWinningTeamIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :winning_team_id, :integer
  end
end
