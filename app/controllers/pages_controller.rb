class PagesController < ApplicationController
  def home
    redirect_to games_path if user_signed_in?
  end
end
