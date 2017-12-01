class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json(include: [:user_boardgames])
  end

  def create
    user = User.new
  end

  def show
    user = User.find(params[:id])
    render json: {user: user, boardgames: user.package_json}
  end

  def update
    byebug
    user = User.find(params[:id])
    user.update(params)
  end

  def createBoardgame
    byebug
  end


end
