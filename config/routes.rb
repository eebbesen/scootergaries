# frozen_string_literal: true

Rails.application.routes.draw do
  post 'play/play', to: 'play#play', as: 'play_play'
  get 'play/:locator',  to: 'play#join', as: 'play_join'
  resources :players
  resources :games
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
