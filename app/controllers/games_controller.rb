class GamesController < ApplicationController
  before_action :require_user

  def new
    @game = Game.new
  end

  def create
    @game = Game.where(name: game_params[:name].parameterize.gsub("-", " ").titleize).first_or_initialize
    @game.users << current_user

    if @game.save
      redirect_to games_path, notice: "#{@game.name} was added to your tracked games!"
    else
      render :new
    end
  end

  def index
    @games = current_user.games
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def require_user
    redirect_to root_path, alert: "Please sign in" unless user_signed_in?
  end
end
