FactoryBot.define do
  factory :password do
    website { "https://google.com" }
    username { "User" }
    password { "123456" }
  end
end
