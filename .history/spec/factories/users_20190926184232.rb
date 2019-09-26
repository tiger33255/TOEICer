FactoryBot.define do
  factory :user do
    email {"rspec@test.com"}
    password {"111111"}
    first_name {"田中"}
    last_name {"太郎"}
    nickname {"タロちゃん"}
    toeic_score {"990"}
  end
end
