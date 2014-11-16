class Game < ActiveRecord::Base
  has_many :tracked_games
  has_many :users, through: :tracked_games
end
