# frozen_string_literal: true

## Player answers for a card in a game
class GamePlayerCard < ApplicationRecord
  belongs_to :game_player, foreign_key: :player_id
  belongs_to :card

  # look for existing user for this game
  # if none, create it
  def self.find_or_make(player_id, game_id)
    sql = <<~SQL
      SELECT gpc.*
        FROM game_player_cards gpc,
             games g
       WHERE gpc.player_id = :player_id
         AND g.id = :game_id
         AND g.active_card_id = gpc.card_id
    SQL

    game_player_card = GamePlayerCard.find_by_sql([sql, player_id: player_id, game_id: game_id]).first

    unless game_player_card
      @game = Game.find game_id
      game_player_card = GamePlayerCard.create(player_id: player_id, card_id: @game.active_card_id)
    end

    game_player_card
  end
end
