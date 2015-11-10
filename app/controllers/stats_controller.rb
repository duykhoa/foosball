class StatsController < ApplicationController
  def index
    @best_team_stat = Stat.new.best_team
    @best_team = Team.find @best_team_stat.first.winning_team_id
    @count_win_for_users = Stat.new.count_win
    @total_game_for_users = Stat.new.total_game
  end
end
