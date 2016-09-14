require "rails_helper"

RSpec.describe CasoMailer, type: :mailer do

   let(:user) { FactoryGirl.create(:user) }
   let(:content) { "SEUS CASOS" }
   let(:mail) { described_class.feed_de_casos(user, content).deliver_now }

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
