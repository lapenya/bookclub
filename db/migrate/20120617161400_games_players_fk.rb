class GamesPlayersFk < ActiveRecord::Migration
  def up
    remove_column :games, :game_players_id
    remove_column :players, :game_players_id
  end

  def down
  end
end
