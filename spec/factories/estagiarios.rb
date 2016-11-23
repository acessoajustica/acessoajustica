FactoryGirl.define do
  factory :estagiario do
    nome "Joana Silveira"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    cor "Negro"
    identidade_de_genero "Homem"
    ano_faculdade "1991-03-02"
    created_at "2016-11-23"
    updated_at "2016-11-23"
    
    trait :estagiario_invalid do
      nome nil
    end
    trait :new_estagiario do
      nome "Criminal da Silva"
    end
    trait :another do
      nome "Maria da Silva"
    end
  end
end
