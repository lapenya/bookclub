class RsvpController < ApplicationController

  layout 'games'

  def update
    @player = Player.find params[:personaje]
    @game   = Game.find params[:partidico]

    if request.post?
      response = params[:commit] == 'Si'
      @gp = GamePlayers.find_or_create_by_game_id_and_player_id(@game.id, @player.id)
      @gp.response = response
      @gp.save!

      @confirmed = Player.will_come(@game.id)
      InterMailer.invite_response(@game, @player, response).deliver
      render :response
    end
  end
end
