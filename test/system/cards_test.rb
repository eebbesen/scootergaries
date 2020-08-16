# frozen_string_literal: true

require 'application_system_test_case'

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test 'visiting the index' do
    visit cards_url
    assert_selector 'h1', text: 'Cards'
  end

  test 'creating a Card' do
    visit cards_url
    click_on 'New Card'

    fill_in 'Notes', with: @card.notes
    fill_in 'Slot 1', with: @card.slot_1
    fill_in 'Slot 10', with: @card.slot_10
    fill_in 'Slot 11', with: @card.slot_11
    fill_in 'Slot 12', with: @card.slot_12
    fill_in 'Slot 2', with: @card.slot_2
    fill_in 'Slot 3', with: @card.slot_3
    fill_in 'Slot 4', with: @card.slot_4
    fill_in 'Slot 5', with: @card.slot_5
    fill_in 'Slot 6', with: @card.slot_6
    fill_in 'Slot 7', with: @card.slot_7
    fill_in 'Slot 8', with: @card.slot_8
    fill_in 'Slot 9', with: @card.slot_9
    fill_in 'Title', with: @card.title + ('a'..'z').sort_by { rand }[0, 10].join
    click_on 'Create Card'

    assert_text 'Card was successfully created'
    click_on 'Back'
  end

  test 'updating a Card' do
    visit cards_url
    click_on @card.title, match: :first

    click_on 'Edit'

    fill_in 'Notes', with: @card.notes
    fill_in 'Slot 1', with: @card.slot_1
    fill_in 'Slot 10', with: @card.slot_10
    fill_in 'Slot 11', with: @card.slot_11
    fill_in 'Slot 12', with: @card.slot_12
    fill_in 'Slot 2', with: @card.slot_2
    fill_in 'Slot 3', with: @card.slot_3
    fill_in 'Slot 4', with: @card.slot_4
    fill_in 'Slot 5', with: @card.slot_5
    fill_in 'Slot 6', with: @card.slot_6
    fill_in 'Slot 7', with: @card.slot_7
    fill_in 'Slot 8', with: @card.slot_8
    fill_in 'Slot 9', with: @card.slot_9
    fill_in 'Title', with: @card.title
    click_on 'Update Card'

    assert_text 'Card was successfully updated'
    click_on 'Back'
  end
end
