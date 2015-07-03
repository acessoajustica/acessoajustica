Given(/^I am that estagiario$/) do
  me = User.all.last
  me.membro_id = Membro.all.last.id
  me.save
end