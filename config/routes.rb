# frozen_string_literal: true

Rails.application.routes.draw do
  post 'play/play', to: 'play#play', as: 'play_play'
  post 'play/entries/:game_player_card_id', to: 'play#entries', as: 'play_entries'
  get 'play/:locator', to: 'play#join', as: 'play_join'
  resources :players
  resources :games
  resources :cards
  resources :game_player_cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
