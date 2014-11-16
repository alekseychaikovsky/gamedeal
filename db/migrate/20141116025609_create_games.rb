class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, :search_term, :deal_url, :comments_url
      t.timestamps
    end
  end
end
