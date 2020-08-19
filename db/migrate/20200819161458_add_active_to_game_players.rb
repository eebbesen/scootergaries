class AddActiveToGamePlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_players, :active, :boolean
  end
end
