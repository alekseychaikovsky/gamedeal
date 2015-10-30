class Game < ActiveRecord::Base
  has_many :tracked_games
  has_many :game_deals
  has_many :users, through: :tracked_games

  before_create :set_search_term
  validates :name, presence: true

  def to_s
    name
  end

  private

  def set_search_term
    self.search_term = name.downcase
  end
end
