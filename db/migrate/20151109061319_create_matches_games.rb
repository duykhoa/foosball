class CreateMatchesGames < ActiveRecord::Migration
  def change
    create_table :matches_games do |t|
      t.integer :match_id
      t.integer :game_id
    end
  end
end
