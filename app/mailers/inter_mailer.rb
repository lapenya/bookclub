# -*- encoding : utf-8 -*-
class InterMailer < ActionMailer::Base
  default from: "interlavapies@gmail.com"

  def new_game(game, player)
    @game = game
    @player = player
    mail(to: player.email, subject: game.subject)
  end

  def invite_response(game, player)
    @game = game
    mail(to: 'pablo.molinacandel@gmail.com', subject: "#{player.name} no viene al partido del día #{game.daytime.day}")
  end

end
