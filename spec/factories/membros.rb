FactoryGirl.define do
  factory :membro do
    nome "João da Silva"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    cor "Negro"
    identidade_de_genero "Homem"
    ano_faculdade "1980-01-01"

    trait :membro_invalid do
      ano_faculdade "1980"
    end
  end
end