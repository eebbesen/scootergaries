class RemovePlayerIdFromGamePlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :game_players, :player_id
  end
end
