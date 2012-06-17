# -*- encoding : utf-8 -*-
class Game < ActiveRecord::Base
  has_many :game_players, class_name: 'GamePlayers'
  has_many :players, through: :game_players

  def subject
    "Día #{self.daytime.day} a las #{self.daytime.strftime('%I:%M')} en el #{self.ground}"
  end

  def invite_text
    "¿Jugarás el próximo día #{self.daytime.day} a las #{self.daytime.strftime('%I:%M')} en el #{self.ground}?"
  end
end
