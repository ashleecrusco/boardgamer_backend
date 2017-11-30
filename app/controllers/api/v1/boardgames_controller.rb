class Api::V1::BoardgamesController < ApplicationController

  def index
    boardgames = Boardgame.all
    render json: boardgames.to_json()
  end

  
end
