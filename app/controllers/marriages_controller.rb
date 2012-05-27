class MarriagesController < ApplicationController

  layout 'marriage'

  def load
    puts "holaaaa"
    if !request.xhr? || (view = params[:view]).blank?
      render :nothing
    else
      render view, :layout => false
    end
  end

end
