class CasoMailer < ApplicationMailer
  default from: 'noreplyparajas@gmail.com'

  def feed_de_casos(user, atualizacao)
    @user = user
    @atualizacao = atualizacao

    mail(to: @user.email, subject: 'Intimações do dia ' \
         + Time.now.strftime("%d/%m/%Y"))
  end
end
