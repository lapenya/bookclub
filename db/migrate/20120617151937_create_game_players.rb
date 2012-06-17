class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.boolean :response
      t.references :game
      t.references :player

      t.timestamps
    end
    add_index :game_players, :game_id
    add_index :game_players, :player_id
  end
end
