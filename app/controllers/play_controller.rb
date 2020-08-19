class PlayController < ApplicationController
  def join
    @game = Game.where(locator: params[:locator]).first

    if @game
      @player = GamePlayer.first_or_create(
        session_id: session_id,
        game_id: @game.id
      )
      @player.save! unless @player.persisted?

      if @player.name
        render 'play'
        return
      end
    else
      flash.now[:notice] = "Game #{params[:locator]} does not exist"
    end
  end

  def play
    @game = Game.find(params[:game_id])
    @player = GamePlayer.find(params[:player_id])
    @player.name = params[:name] unless @player.name
    @player.save! unless @player.name
  end

  # for testing -- we don't have users login so this is not set by devise
  # but overridden in the system test
  def session_id
    session.id
  end
end
