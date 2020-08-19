class AddSessionToGamePlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_players, :session_id, :string
  end
end
