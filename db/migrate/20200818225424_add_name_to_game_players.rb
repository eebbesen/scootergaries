class AddNameToGamePlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :game_players, :name, :string
  end
end
