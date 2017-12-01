class Api::V1::BoardgamesController < ApplicationController

  def index
    boardgames = Boardgame.all
    boardgames = boardgames.map do |boardgame|
      boardgame.package_json_with_likes
    end
    render json: boardgames.to_json()
  end

  def create
  end


end
