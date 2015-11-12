class GameHistoriesController < ApplicationController
  def index
    @game_histories = Game.single
  end
end
