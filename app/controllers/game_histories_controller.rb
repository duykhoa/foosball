class GameHistoriesController < ApplicationController
  def index
    @game_histories = GameHistory.all
  end
end
