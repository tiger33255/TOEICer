FactoryBot.define do
    factory :user do
      email {"rspec@test.com"}
      password {"111111"}
      first_name {"田中"}
      last_name {"太郎"}
      nickname {"タロちゃん"}
      toeic_score {"990"}
    end

    factory :user2 do
      email {"rspec2@test.com"}
      password {"222222"}
      first_name {"田中"}
      last_name {"太郎"}
      nickname {"タロちゃん"}
      toeic_score {"990"}


    trait :skip_validate do
      to_create {|instance| instance.save(validate: false)}
    end
  end
end
