# frozen_string_literal: true

require 'application_system_test_case'

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test 'visiting the index' do
    visit games_url
    assert_selector 'h1', text: 'Games'
  end

  test 'creating a Game' do
    Capybara.using_wait_time(10) do
      visit games_url
      click_on 'New Game'
      fill_in 'Title', with: "#{@game.title}b"
      fill_in 'Locator', with: "#{@game.locator}a"
      click_on 'Create Game'

      assert_text 'Game was successfully created'
      click_on 'Back'
    end
  end

  test 'updating a Game' do
    Capybara.using_wait_time(10) do
      visit games_url
      click_on 'first'

      click_on 'Edit', match: :first

      fill_in 'Title', with: @game.title
      fill_in 'Locator', with: @game.locator
      click_on 'Update Game'

      assert_text 'Game was successfully updated'
      click_on 'Back'
    end
  end
end
