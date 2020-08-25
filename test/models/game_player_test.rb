# frozen_string_literal: true

require 'test_helper'

class GamePlayerTest < ActiveSupport::TestCase
  setup do
    @game = games(:one)
    @game.cards.push cards(:cards_one)
    @game.cards.push cards(:cards_two)
  end

  test '.find_or_make should retrieve player' do
    gp = GamePlayer.create(session_id: 'abcd1234', game: @game, name: 'Omar')

    assert_equal gp.id, GamePlayer.find_or_make(@game.id, 'abcd1234').id
  end

  test '.find_or_make should respect session_id' do
    existing_gp = GamePlayer.create(session_id: 'abcd1234', game: @game, name: 'Omar')

    assert_difference('GamePlayer.count', 1) do
      gp = GamePlayer.find_or_make(@game.id, 'abcd123z')

      assert_nil gp.name
      assert_equal @game.id, gp.game.id
      assert_equal 'abcd123z', gp.session_id
      assert gp.id != existing_gp.id
    end
  end
end
