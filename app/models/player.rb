class Player < ActiveRecord::Base
  has_many :game_players, class_name: 'GamePlayers'
  has_many :games, through: :game_players

  scope :will_come, lambda { |game| where("game_players.response = true AND game_players.game_id = ?", game).joins(:game_players) }
end
