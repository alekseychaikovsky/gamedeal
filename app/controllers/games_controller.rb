class GamesController < ApplicationController
  before_action :require_user

  def new
    @game = Game.new
  end

  def create
    @game_name = game_params[:name].parameterize.gsub("-", " ").titleize
    @game = Game.where(name: @game_name).first_or_create
    @tracked_game = TrackedGame.new(user: current_user, game: @game)

    if @tracked_game.save
      redirect_to games_path, notice: "#{@game.name} was added to your tracked games!"
    else
      @game = Game.new
      flash[:alert] = "#{@game_name} is already in your list of tracked games!"
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
