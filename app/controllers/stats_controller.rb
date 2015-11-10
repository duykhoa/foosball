class StatsController < ApplicationController
  def index
    @stat = Stat.best_team
  end
end
