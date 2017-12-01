class AddSlugToBoardgames < ActiveRecord::Migration[5.1]
  def change
    add_column :boardgames, :slug, :string  
  end
end
