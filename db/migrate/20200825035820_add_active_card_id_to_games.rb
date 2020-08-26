class AddActiveCardIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :active_card_id, :integer
  end
end
