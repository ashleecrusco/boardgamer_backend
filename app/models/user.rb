class User < ApplicationRecord
  has_many :user_boardgames
  has_many :boardgames, through: :user_boardgames
  has_many :friendships
  has_many :friends, through: :friendships
  has_secure_password

  def package_json
    self.user_boardgames.map do|user_boardgame|
      raw_json = {info: user_boardgame, game: user_boardgame.boardgame}
    end
  end
end
