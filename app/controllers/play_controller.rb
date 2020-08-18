class PlayController < ApplicationController
  def play
    @game = Game.where(locator: params[:locator]).first

    flash.now[:notice] = "Game #{params[:locator]} does not exist" unless @game
  end
end
