# frozen_string_literal: true

require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test 'should get index' do
    get cards_url
    assert_response :success
  end

  test 'should get new' do
    get new_card_url
    assert_response :success
  end

  test 'should create card' do
    assert_difference('Card.count') do
      post cards_url, params: { card: { notes: @card.notes, slot_1: @card.slot_1, slot_10: @card.slot_10, slot_11: @card.slot_11, slot_12: @card.slot_12, slot_2: @card.slot_2, slot_3: @card.slot_3, slot_4: @card.slot_4, slot_5: @card.slot_5, slot_6: @card.slot_6, slot_7: @card.slot_7, slot_8: @card.slot_8, slot_9: @card.slot_9, title: 'a new card' } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test 'should show card' do
    get card_url(@card)
    assert_response :success
  end

  test 'should get edit' do
    get edit_card_url(@card)
    assert_response :success
  end

  test 'should update card' do
    patch card_url(@card), params: { card: { notes: 'updated card', slot_1: @card.slot_1, slot_10: @card.slot_10, slot_11: @card.slot_11, slot_12: @card.slot_12, slot_2: @card.slot_2, slot_3: @card.slot_3, slot_4: @card.slot_4, slot_5: @card.slot_5, slot_6: @card.slot_6, slot_7: @card.slot_7, slot_8: @card.slot_8, slot_9: @card.slot_9, title: @card.title } }
    assert_redirected_to card_url(@card)
  end

  test 'should destroy card' do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
