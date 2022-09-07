FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    emitter { "MyString" }
    receiver { "MyString" }
    amount { 1 }
    emitted_at { "2022-09-05 05:57:18" }
    user_id { 1 }
  end
end
