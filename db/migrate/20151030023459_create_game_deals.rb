class CreateGameDeals < ActiveRecord::Migration
  def change
    create_table :game_deals do |t|
      t.references :game
      t.string :deal_url
      t.string :comments_url
    end
  end
end
