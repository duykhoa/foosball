class AddTeam1IdToGames < ActiveRecord::Migration
  def change
    add_column :games, :team1_id, :integer
  end
end
