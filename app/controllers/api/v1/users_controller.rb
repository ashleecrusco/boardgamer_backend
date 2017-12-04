class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json(include: [:user_boardgames])
  end

  def createUser
    user = User.new(user_params)
    if user.valid?
      user.save
      render json: user.package_json
    else
      render json: {error: 'Invalid User Input', status: '400'}
    end
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
    user = User.find(params['id'].to_i)
    new_game = Boardgame.new(game_params)

    if new_game.valid?
      new_game.slug = params['form']['name'].gsub(/[ ;?@:&]/, '').downcase
      new_game.save
      user.boardgames << new_game
      user_boardgame = user.user_boardgames.last
      user_boardgame.update_attributes(user_boardgame_params)
      render json: new_game.package_json
    else
      render json: {error: 'Invalid Game Input', status: '400'}
    end
  end

  private

  def game_params
    params.require(:form).permit(:name, :description, :manufacturer, :category, :image_url)
  end

  def user_boardgame_params
    params.require(:form).permit(:wishlist, :owned, :favorite)
  end

  def user_params
    params.require(:form).permit(:first_name, :last_name, :username, :password, :profile_image_url)
  end
end
