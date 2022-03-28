FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    ubication { Faker::Address.full_address }

    owner # factobu bot hace referencia al factory de user
  end
end
