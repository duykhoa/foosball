class AddTeam2IdToGames < ActiveRecord::Migration
  def change
    add_column :games, :team2_id, :integer
  end
end
