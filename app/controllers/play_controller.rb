# frozen_string_literal: true

class PlayController < ApplicationController
  def join
    @game = Game.where(locator: params[:locator]).first

    if @game
      @player = GamePlayer.find_or_make(@game.id, session_id)

      if @game.active_card_id
        if @player.name
          @game_player_card = GamePlayerCard.find_or_make(@player.id, @game.id)
          render 'play'
          nil
        end
      else
        flash.now[:notice] = "Game #{params[:locator]} does not have an active card"
      end
    else
      flash.now[:notice] = "Game #{params[:locator]} does not exist"
    end
  end

  def play
    @game = Game.find(params[:game_id])
    @player = GamePlayer.find(params[:player_id])
    @game_player_card = GamePlayerCard.find_or_make(@player.id, @game.id)

    return if @player.name

    @player.name = params[:name]
    @player.save!
  end

  def answer
    # confirm session.id
    @game_player_card = GamePlayerCard.find params[:game_player_card_id]
    return unless session_id == @game_player_card.game_player.session_id

    @game_player_card.attributes = game_player_card_params
    @game_player_card.save!

    flash.now[:notice] = 'Answers saved'
  end

  private

  # for testing -- we don't have users login so this is not set by devise
  # but overridden in the system test
  def session_id
    session.id.to_s
  end

  # Only allow a list of trusted parameters through.
  def game_player_card_params
    params.permit(:slot_1, :slot_2, :slot_3, :slot_4, :slot_5, :slot_6, :slot_7, :slot_8, :slot_9, :slot_10, :slot_11, :slot_12, :locator)
  end
end
