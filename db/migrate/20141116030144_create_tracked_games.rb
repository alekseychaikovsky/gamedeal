class CreateTrackedGames < ActiveRecord::Migration
  def change
    create_table :tracked_games do |t|
      t.belongs_to :game
      t.belongs_to :user
      t.timestamps
    end
  end
end
