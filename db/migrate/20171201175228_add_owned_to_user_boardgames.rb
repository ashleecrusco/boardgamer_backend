class AddOwnedToUserBoardgames < ActiveRecord::Migration[5.1]
  def change
    add_column :user_boardgames, :owned, :boolean, :default => false
  end
end
