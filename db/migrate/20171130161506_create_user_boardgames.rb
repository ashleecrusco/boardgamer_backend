class CreateUserBoardgames < ActiveRecord::Migration[5.1]
  def change
    create_table :user_boardgames do |t|
      t.integer :user_id
      t.integer :boardgame_id
      t.boolean :favorite, :default => false
      t.boolean :wishlist, :default => false
      t.boolean :lent, :default => false
      t.boolean :borrowed, :default => false

      t.timestamps
    end
  end
end
