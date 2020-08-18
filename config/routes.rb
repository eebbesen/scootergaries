# frozen_string_literal: true

Rails.application.routes.draw do
  get 'play/:locator', to: 'play#play', as: 'play_play'
  resources :players
  resources :games
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
