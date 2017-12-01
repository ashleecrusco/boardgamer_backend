class Boardgame < ApplicationRecord
  has_many :user_boardgames
  has_many :users, through: :user_boardgames

  validates :name, presence: true
  validates :manufacturer, presence: true
  validates :image_url, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :name, uniqueness: true

  def package_json
    return {users: self.user_boardgames, info: self}
  end

  def package_json_with_likes
    likes = self.user_boardgames.count{|user| user.favorite}
    {game: self, likes: likes}
  end

end
