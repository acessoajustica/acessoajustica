# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# Creating roles.
admin_role = Role.create!(:name => "admin")
diretor_role = Role.create!(:name => "diretor")
vavreiro_role = Role.create!(:name => "vareiro")
calouro_role = Role.create!(:name => "calouro")
estagiario_role = Role.create!(:name => "estagiário")

# Creating admin users
admin_user = User.create!(:email=>'test@test.com',:username=>'admin',:password=>'password')

# Creating estado_civil's
EstadoCivil.create!(:description => "solteiro")
EstadoCivil.create!(:description => "casado")
EstadoCivil.create!(:description => "divorciado")
EstadoCivil.create!(:description => "viúvo")

# Creating profissao's
ProfissaoType.create!(:description => "Primário")
ProfissaoType.create!(:description => "Secundário")
ProfissaoType.create!(:description => "Terciário")

# assign the admin role to the admin user.  (This bit of rails
# magic creates a user_role record in the database.)
admin_user.roles << admin_role

case Rails.env
  when "development"
    # Creating cliente
    cliente = Cliente.create!(:nome => "João da Silva",
              :cpf  => "123.456.789-00",
              :nome_da_mae => "Maria da Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero => "Homem",
              :familia_renda  => 1500.00,
              :filhos_quantidade  => 6,
              :profissao_nome  => "Assistente Administrativo",
              :familia_quantidade => 9,
              :contribuintes_quantidade => 4)

    estagiario = Estagiario.create!(:nome => "Joana Silveira ",
              :cpf =>"123.456.789-00",
              :nome_da_mae  =>  "Maria da Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero  => "Homem",
              :ano_faculdade  => "1991-03-02",
              :especialidade =>  "Ovos")

    estagiario_user = User.create!(:email=>'estagiario@test.com',
              :username=>'estagiario',
              :password=>'12345678',
              :membro_id => estagiario.membro.id)
    
    estagiario_user.roles << estagiario_role

    resultado_type = CasoResultado.create!(:description => "Orientação")

    # Creating caso
    caso1 = Caso.create!(:status => true, :cliente => cliente)
    caso2 = Caso.create!(:status => false, :cliente => cliente)
    caso3 = Caso.create!(:status => true, :cliente => cliente, :estagiario => estagiario,
      :caso_resultado => resultado_type)

    # Creating relato
    relato = Relato.create!(:description => "Relato teste para teste que será testado nesse teste.",
            :caso => caso1)

    cliente2 = Cliente.create!( :nome => "Abreu da Silva Sauro",
              :cpf  =>"123.456.789-00",
              :nome_da_mae => "Maria d,a Penha",
              :rg  => "12.345.678-9",
              :cor  => "Negro",
              :identidade_de_genero => "Homem",
              :familia_renda  => 1500.00,
              :filhos_quantidade  => 6,
              :profissao_nome  =>"Assistente Administrativo",
              :familia_quantidade => 9,
              :contribuintes_quantidade => 4)

    # Creating caso
    caso3 = Caso.create!(:status => true, :cliente => cliente2)

    # Creating relato
    relato = Relato.create!(:description => "Relato teste para teste que será testado nesse teste. Relato teste para teste que será testado nesse teste. Relato teste para teste que será testado nesse teste. Relato teste para teste que será testado nesse teste.",
            :caso => caso3)
end