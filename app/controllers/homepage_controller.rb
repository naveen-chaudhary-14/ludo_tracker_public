class HomepageController < ApplicationController
  def index
    @players = Player.order(total_win: :desc, points: :desc)
  end
end
