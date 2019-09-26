FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "hiro#{n}@example.com"}    password {"111111"}
    first_name {"田中"}
    last_name {"太郎"}
    nickname {"タロちゃん"}
    toeic_score {"990"}

    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}
    end
  end
end