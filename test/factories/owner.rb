FactoryBot.define do
  factory :owner do
    phonenumber { Faker::PhoneNumber.cell_phone }
    user # factobu bot hace referencia al factory de user
  end
end
