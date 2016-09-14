class CasoMailer < ApplicationMailer
  default from: 'noreplyparajas@gmail.com'

  def feed_de_casos(user)
    @user = user

    mail(to: @user.mail, subject: 'Intimações do dia ' \
         + Time.now.strftime("%d/%m/%Y"))
  end
end
