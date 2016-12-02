FactoryGirl.define do
  factory :vareiro do
    nome "João da Silva"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    cor "Negro"
    identidade_de_genero "Homem"
    ano_faculdade 1991
    forum "Huevos"
    created_at "2016-11-23"
    updated_at "2016-11-23"

    trait :vareiro_invalid do
      nome nil
    end
    trait :new_vareiro do
      nome "Criminal da Silva"
    end
  end
end
