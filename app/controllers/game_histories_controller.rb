class GameHistoriesController < ApplicationController
  def index
    @games = Game.single
  end
end
