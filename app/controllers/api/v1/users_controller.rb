class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json(include: [:user_boardgames])
  end

  def createUser
    user = User.new(create_user_params)
    if user.valid?
      user.save
      render json: user.package_json
    else
      render json: {error: 'Invalid User Input', status: '400'}
    end
  end

  def show
    user = User.find(user_params[:id])
    render json: {user: user, boardgames: user.package_json, friends: user.friends}
  end

  def edit

  end

  def update
    user = User.find(update_user_params[:id])
    user.update(update_user_params)
  end

  def addToCollection
    game = Boardgame.find(collection_game_params[:id].to_i)
    user = User.find(collection_user_params[:user_id])
    if !user.boardgames.include?(game)
      user.boardgames << game
    end
    gameId = user.boardgames.find_by(name: params[:game][:name]).id
    gameToUpdate = user.user_boardgames.find_by(boardgame_id: gameId)
    gameToUpdate.update_attributes(owned: true)
    if user.user_boardgames.find_by(boardgame_id: game.id).wishlist === true
      user.user_boardgames.find_by(boardgame_id: game.id).update_attributes(wishlist: false)
    end
  end

  def removeFromCollection
    game = Boardgame.find(collection_game_params[:id].to_i)
    user = User.find(collection_user_params[:user_id])
    if user.boardgames.include?(game)
      user.boardgames.delete(game)
    end
    gameId = user.boardgames.find_by(name: params[:game][:name]).id
    gameToUpdate = user.user_boardgames.find_by(boardgame_id: gameId)
    gameToUpdate.update_attributes(owned: false)

  end


  def updateAttribute
    user = User.find(update_attribute_params[:user])
    attribute = update_attribute_params[:attribute]
    game = Boardgame.find(update_attribute_params[:game])
    if user.user_boardgames.find_by(boardgame_id: game.id)
      relation = user.user_boardgames.find_by(boardgame_id: game.id)
      relation[attribute] = !relation[attribute]
      relation.update_attributes("#{attribute}": relation[attribute])
    else
      user.boardgames << game
      gameId = user.boardgames.find_by(name: game.name).id
      gameToUpdate = user.user_boardgames.find_by(boardgame_id: gameId)
      gameToUpdate[attribute] = !gameToUpdate[attribute]
      gameToUpdate.update_attributes("#{attribute}": gameToUpdate[attribute])
    end
    if user.user_boardgames.find_by(boardgame_id: game.id).wishlist === true
      user.user_boardgames.find_by(boardgame_id: game.id).update_attributes(owned: false)
    end
  end

  def addOrRemoveFriend
    user = User.find(params['user_id'])
    friend = User.find(params['friend_id'])
    if params['removing']
      user.friendships.where(friend_id: friend.id).destroy_all
    elsif friend.id != user.id
      user.friends << friend
    end
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
      render json: {error: 'Invalid Game Input', status: '401'}
    end
  end

  private

  def game_params
    params.require(:form).permit(:name, :description, :manufacturer, :category, :image_url)
  end

  def user_boardgame_params
    params.require(:form).permit(:wishlist, :owned, :favorite)
  end

  def create_user_params
    params.require(:form).permit(:first_name, :last_name, :username, :password, :profile_image_url)
  end

  def collection_game_params
    params.require(:game).permit(:id)
  end

  def collection_user_params
    params.permit(:user_id)
  end

  def user_params
    params.permit(:id)
  end

  def update_attribute_params
    params.permit(:attribute, :user, :game)
  end

  def update_user_params
    params.permit(:id, :profile_image_url)
  end
end
