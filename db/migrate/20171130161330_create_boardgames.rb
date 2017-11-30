class CreateBoardgames < ActiveRecord::Migration[5.1]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :image_url
      t.string :manufacturer

      t.timestamps
    end
  end
end
