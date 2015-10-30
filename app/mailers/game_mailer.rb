class GameMailer < ActionMailer::Base
  default from: "notification@aleksey-gamedeals.herokuapp.com"

  def game_email(user, game, game_deal)
    @user = user
    @game = game
    @game_deal = game_deal
    @deal_url = @game_deal.deal_url
    @comments_url = @game_deal.comments_url

    mail(to: @user.email, subject: "#{game} is on sale")
  end
end
