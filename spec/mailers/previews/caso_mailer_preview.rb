# Preview all emails at http://localhost:3000/rails/mailers/caso_mailer
class CasoMailerPreview < ActionMailer::Preview
  def test
  	@user = User.new
    @user.email = "noreplyparajas@gmail.com"
    @user.id = 123456789
  	@atualizacao =
    {
        date: Time.new(2016,9,16).strftime("%d/%m/%Y"),
        casos: [
            {
                id: 42,
                nome_cliente: 'Fulano',
                processos_update: [
                    {
                        processo_id: 7,
                        diario_oficial: 'STF',
                        secao: 'III - Avisos',
                        atualizacao: 'HueHueHue'
                    },
                    {
                        processo_id: 13,
                        diario_oficial: 'DOM - SP',
                        secao: 'II - Capital',
                        atualizacao: 'Kkkkkkkkk'
                    }
                ]
            },
            {
                id: 1789,
                nome_cliente: 'Gubi',
                processos_update: [
                    {
                        processo_id: 713,
                        diario_oficial: 'DOM - SP',
                        secao: 'III - Avisos',
                        atualizacao: 'HueHueHueBRBRBRBR'
                    }
                ]
            }
        ]
    }
    CasoMailer.feed_de_casos(@user, @atualizacao)
    EmailTestJob.new(@user, @atualizacao).perform_now
  end
end
