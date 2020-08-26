# frozen_string_literal: true

require 'application_system_test_case'

class PlayController
  # for testing -- we don't have users login so this is not set by devise
  # but overridden in the system test
  def session_id
    'abcd1234'
  end
end

class PlayTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
    @game.cards.push cards(:cards_one)
    @game.update_attribute(:active_card_id, @game.cards.first.id)
  end

  test 'game does not exist' do
    bad_locator = "#{@game.locator}bad"
    visit play_join_url(bad_locator)

    assert_text "Game #{bad_locator} does not exist"
  end

  test 'game exists but not player' do
    assert_difference('GamePlayer.count', 1) do
      @game.cards.push cards(:cards_two)

      visit play_join_url @game.locator

      fill_in 'Name', with: 'User123'
      click_on 'Join Game'

      assert_text @game.cards[0].title
      assert_text @game.cards[1].title
    end

    gp = GamePlayer.last
    assert_equal 'User123', gp.name
    assert_equal @game.id, gp.game_id
    assert_equal 'abcd1234', gp.session_id
  end

  test 'game and player exist' do
    GamePlayer.create(name: 'User123', game: @game, session_id: 'abcd1234')
    assert_difference('GamePlayer.count', 0) do
      visit play_join_url @game.locator

      assert_text @game.cards.first.title
      assert_text 'User123'
      assert_no_text 'Join'
    end
  end
  test 'enter answers' do
    gp = GamePlayer.create(name: 'User123', game: @game, session_id: 'abcd1234')
    assert_difference('GamePlayer.count', 0) do
      visit play_join_url @game.locator
      fill_in 'slot_3', with: 'icicles'
      click_on 'Submit Answers'

      assert_equal 'icicles', find('#slot_3').value
      assert_equal 'icicles', gp.game_player_cards.first.slot_3
      assert_text "Answers saved at #{DateTime.now.strftime('%I:%M:%S %p')}"
    end
  end

  test 'game exists and player exists with same session for different game' do
    old_game = games(:two)
    old_game.cards.push cards(:cards_two)
    GamePlayer.create(name: 'User123', game: old_game, session_id: 'abcd1234')
    assert_difference('GamePlayer.count', 1) do
      visit play_join_url @game.locator

      fill_in 'Name', with: 'User123'
      click_on 'Join Game'

      assert_text @game.cards.first.title

      gp = GamePlayer.last
      assert_equal 'User123', gp.name
    end
  end
end
