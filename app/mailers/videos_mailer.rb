# -*- encoding : utf-8 -*-
class VideosMailer < ActionMailer::Base
  default from: "interlavapies@gmail.com"

  DANI_EMAIL = 'danivieldv@gmail.com'
  MI_EMAIL   = 'pablo.molinacandel@gmail.com'
  MI_EMAIL_2 = 'el.pablines@gmail.com'

  def new_video(video)
    @video = video
    recipients = Rails.env.production? ? [MI_EMAIL, DANI_EMAIL] : MI_EMAIL
    mail(to: recipients, subject: "Nuevo vídeo en #{video.state}, #{video.country}")
  end

  class Preview < MailView
    def new_video
      video = Video.last
      VideosMailer.new_video(video)
    end
  end

end
