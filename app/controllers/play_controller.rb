class PlayController < ApplicationController
  def join
    @game = Game.where(locator: params[:locator]).first

    if @game
      @player = cookies["player#{@game.id}name"]
    else
      flash.now[:notice] = "Game #{params[:locator]} does not exist"
    end

  end

  def play
    cookies["player#{params[:game_id]}name"] = params[:name]
    @game = Game.find(params[:game_id])
    @player = Player.create!(name: params[:name])
    GamePlayer.create!(game_id: @game.id, player_id: @player.id)
  end
end
