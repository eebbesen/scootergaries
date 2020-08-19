# frozen_string_literal: true

class PlayController < ApplicationController
  def join
    @game = Game.where(locator: params[:locator]).first

    if @game
      player_check

      if @player.name
        render 'play'
        nil
      end
    else
      flash.now[:notice] = "Game #{params[:locator]} does not exist"
    end
  end

  def play
    @game = Game.find(params[:game_id])
    @player = GamePlayer.find(params[:player_id])

    return if @player.name

    @player.name = params[:name]
    @player.save!
  end

  private

  # for testing -- we don't have users login so this is not set by devise
  # but overridden in the system test
  def session_id
    session.id.to_s
  end

  def player_check
    @player = GamePlayer.where(
      session_id: session_id,
      game_id: @game.id
    ).first_or_create

    @player.save! unless @player.persisted?

    @player
  end
end
