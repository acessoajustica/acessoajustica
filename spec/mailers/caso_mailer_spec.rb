require "rails_helper"

RSpec.describe CasoMailer, type: :mailer do

   let(:user) { FactoryGirl.create(:user) }
   let(:content) { "Fulano" }
   let(:mail) { described_class.feed_de_casos(user, atualizacao).deliver_now }
   let(:atualizacao) {
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
   }

   it 'renders the subject' do
     expect(mail.subject).to eq('Intimações do dia ' \
                                + Time.now.strftime("%d/%m/%Y"))
   end

   it 'renders the receiver email' do
     expect(mail.to).to eq([user.email])
   end

   it 'renders the sender email' do
     expect(mail.from).to eq(['noreplyparajas@gmail.com'])
   end

   it 'renders the content' do
     expect(mail.body.encoded).to match(content)
   end
end
