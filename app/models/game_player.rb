# frozen_string_literal: true

## Player in a game context
class GamePlayer < ApplicationRecord
  belongs_to :game
end
