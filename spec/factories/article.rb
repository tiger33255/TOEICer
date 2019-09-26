FactoryBot.define do
    factory :article do
        title {"Hello world"}
        body {"Good morning"}

        trait :skip_validate do
            to_create {|instance| instance.save(validate: false)}
        end
    end
end