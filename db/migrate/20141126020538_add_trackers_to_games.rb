class AddTrackersToGames < ActiveRecord::Migration
  def change
    add_column :games, :trackers, :integer, default: 0
  end
end
