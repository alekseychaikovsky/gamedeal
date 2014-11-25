class GameMailer < ActionMailer::Base
  default from: "notification@aleksey-gamedeals.herokuapp.com"

  def game_email(user, game)
    @user = user
    @game = game
    @deal_url = @game.deal_url
    @comments_url = @game.comments_url

    mail(to: @user.email, subject: "#{game} is on sale")
  end
end
