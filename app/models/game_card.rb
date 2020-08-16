# frozen_string_literal: true

## Card in a game context
class GameCard < ApplicationRecord
  belongs_to :game
  belongs_to :card
end
