# frozen_string_literal: true

require 'application_system_test_case'

class PlayTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test 'game exists' do
    visit play_play_url @game.locator
  end

  test 'game does not exist' do
    bad_locator = @game.locator + 'bad'
    visit play_play_url(bad_locator)

    assert_text "Game #{bad_locator} does not exist"
  end
end
