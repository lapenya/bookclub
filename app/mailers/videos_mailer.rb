# -*- encoding : utf-8 -*-
class VideosMailer < ActionMailer::Base

  def new_video(video)
    @video = video
    recipients = Rails.env.production? ? ['pablo.molinacandel@gmail.com', 'el.pablines@gmail.com'] : 'pablo.molinacandel@gmail.com'
    mail(to: recipients, subject: "Nuevo vídeo en #{video.state}, #{video.country}")
  end

  class Preview < MailView
    def new_video
      video = Video.last
      VideosMailer.new_video(video)
    end
  end

end
