  FactoryGirl.define do
  factory :user do
    username "adilson"
    email "adilson@gmail.com"
    password "adilson123"
    roles { [ FactoryGirl.create(:role) ] }
  end

  trait :admin_user do
    roles { [ FactoryGirl.create(:role, :admin_role) ] }
  end
  trait :diretor_user do
    roles { [ FactoryGirl.create(:role, :diretor_role) ] }
  end
  trait :estagiario_user do
    roles { [ FactoryGirl.create(:role, :estagiario_role) ] }
  end
  trait :calouro_user do
    roles { [ FactoryGirl.create(:role, :calouro_role) ] }
  end

  factory :role do
    name { "Role_#{rand(9999)}" }
  end

  trait :admin_role do
    name { "admin" }
  end
  trait :diretor_role do
    name { "diretor" }
  end
  trait :estagiario_role do
    name { "estagiário" }
  end
  trait :calouro_role do
    name { "calouro" }
  end

  factory :user_admin do
    username "admin"
    email "admin@gmail.com"
    password "password"
    roles { [ FactoryGirl.create(:role, :admin_role) ] }
  end

  trait :another do
    username "adilsons"
    email "adilsons@gmail.com"
  end
  
end
