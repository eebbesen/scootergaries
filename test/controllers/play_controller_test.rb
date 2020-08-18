require 'test_helper'

class PlayControllerTest < ActionDispatch::IntegrationTest
  test 'should get play with existing game' do
    get play_play_url('hbenv')
    assert_response :success
  end

  test 'should get play with non-exant game' do
    get play_play_url('abczzzz')
    assert_response :success
  end

end
