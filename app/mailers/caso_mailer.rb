class CasoMailer < ApplicationMailer
  default from: 'noreplyparajas@gmail.com'

  def feed_de_casos(user, content)
    @user = user
    @content = content

    mail(to: @user.email, subject: 'Intimações do dia ' \
         + Time.now.strftime("%d/%m/%Y"))
  end
end
