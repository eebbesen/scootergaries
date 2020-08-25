# frozen_string_literal: true

require 'test_helper'

class GamePlayerCardsTest < ActiveSupport::TestCase
  setup do
    @game = games(:one)
    @game.cards.push cards(:cards_one)
    @game.update_attribute(:active_card_id, @game.cards.first.id)
    @player = GamePlayer.create(game: @game, name: 'User123', session_id: 'abcd1234')
  end

  test 'should relate to game_player' do
    gpc = GamePlayerCard.create(game_player: @player, card: @game.cards.first)

    assert_equal @game.cards.first, gpc.card
    assert_equal @game.cards.first.slot_1, gpc.card.slot_1
  end

  test '.find_or_make should retrieve game card player' do
    gpc = GamePlayerCard.create(game_player: @player, card_id: @game.active_card_id)

    found_gpc = GamePlayerCard.find_or_make(@player.id, @game.id)
    assert_equal gpc.id, found_gpc.id
    assert_equal gpc.card_id, found_gpc.card_id
  end

  test '.find_or_make should create new' do
    existing_gpc = GamePlayerCard.create(game_player: @player, card_id: @game.active_card_id)
    new_player = GamePlayer.create(game: @game, name: 'User456', session_id: 'zzzz1234')

    assert_difference('GamePlayerCard.count', 1) do
      found_gpc = GamePlayerCard.find_or_make(new_player.id, @game.id)

      assert existing_gpc.id != found_gpc.id
      assert_equal new_player.id, found_gpc.player_id
      assert_equal @game.active_card_id, found_gpc.card_id
    end
  end

end
