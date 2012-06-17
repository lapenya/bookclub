# -*- encoding : utf-8 -*-
class InterMailer < ActionMailer::Base
  default from: "interlavapies@gmail.com"

  def new_game(game, player)
    @game = game
    @player = player
    mail(to: player.email, subject: game.subject)
  end

  def invite_response(game, player, response)
    @game = game
    subject = player.name
    subject += " NO" unless response
    subject += " viene al partido del día #{game.daytime.day}"

    mail(to: 'pablo.molinacandel@gmail.com', subject: subject)
  end

end
