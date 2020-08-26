# frozen_string_literal: true

class PlayController < ApplicationController
  def join
    @game = Game.where(locator: params[:locator]).first
    return unless join_check

    @player = GamePlayer.find_or_make(@game.id, session_id)
    return unless @player.name

    @game_player_card = GamePlayerCard.find_or_make(@player.id, @game.id)
    render 'play'
    nil
  end

  def play
    @game = Game.find(params[:game_id])
    @player = GamePlayer.find(params[:player_id])
    @game_player_card = GamePlayerCard.find_or_make(@player.id, @game.id)

    return if @player.name

    @player.name = params[:name]
    @player.save!
  end

  def entries
    # confirm session.id
    @game_player_card = GamePlayerCard.find params[:game_player_card_id]
    return unless session_id == @game_player_card.game_player.session_id

    persist_entries

    @game = @game_player_card.game_player.game
    @player = @game_player_card.game_player
    render :play
  end

  private

  # for testing -- we don't have users login so this is not set by devise
  # but overridden in the system test
  def session_id
    session.id.to_s
  end

  def persist_entries
    @game_player_card.attributes = game_player_card_params
    @game_player_card.save!
    flash.now[:notice] = "Answers saved at #{DateTime.now.strftime('%I:%M:%S %p')}"
  end

  # validation
  def join_check
    unless @game
      flash.now[:notice] = "Game #{params[:locator]} does not exist"
      return false
    end
    true
  end

  # Only allow a list of trusted parameters through.
  def game_player_card_params
    params.permit(:slot_1, :slot_2, :slot_3, :slot_4, :slot_5, :slot_6, :slot_7, :slot_8, :slot_9, :slot_10, :slot_11, :slot_12, :locator)
  end
end
