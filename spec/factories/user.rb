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

  factory :role do
    name { "Role_#{rand(9999)}" }
  end

  trait :admin_role do
    name { "admin" }
  end
end

