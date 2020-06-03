FactoryBot.define do
  factory :user do
    name { FFaker::Lorem.word }
    email { FFaker::Internet.email }
    password { "secret123" }
    password_confirmation { "secret123" }
    # confirmed_at { Date.today }
  end
end
