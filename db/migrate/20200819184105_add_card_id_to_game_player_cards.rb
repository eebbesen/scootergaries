class AddCardIdToGamePlayerCards < ActiveRecord::Migration[6.0]
  def change
    add_column :game_player_cards, :card_id, :integer
  end
end
