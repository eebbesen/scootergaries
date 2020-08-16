# frozen_string_literal: true

## Player in a game context
class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :player
end
