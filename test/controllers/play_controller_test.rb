# frozen_string_literal: true

require 'test_helper'

class PlayControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test 'should get join with existing game' do
    get play_join_url(@game.locator)
    assert_response :success
  end

  test 'should get join with non-exant game' do
    get play_join_url("#{@game.locator}#{@game.locator}")
    assert_response :success
  end
end
