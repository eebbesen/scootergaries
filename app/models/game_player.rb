# frozen_string_literal: true

## Player in a game context
class GamePlayer < ApplicationRecord
  belongs_to :game
  has_many :game_player_cards, foreign_key: :player_id

  # look for existing user for this game
  # if none, create it
  def self.find_or_make(game_id, session_id)
    GamePlayer.where(
      session_id: session_id,
      game_id: game_id
    ).first_or_create
  end
end
