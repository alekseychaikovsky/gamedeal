class GameDeal < ActiveRecord::Base
  belongs_to :game

  after_create :send_game_email

  def send_game_email
    game.users.each do |user|
      GameMailer.game_email(user, game).deliver
    end
  end
end
