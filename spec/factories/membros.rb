FactoryGirl.define do
  factory :membro do
    nome "João da Silva"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    cor "Negro"
    identidade_de_genero "Homem"
    ano_faculdade 2007

    trait :membro_invalid do
      ano_faculdade 1579
    end

    trait :new_membro do
      nome "Mario da Silva"
      ano 2012
    end
  end
end
