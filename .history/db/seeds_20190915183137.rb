# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    [
        {   id: '1',
            email: 'test1@test.com',
            password: '111111',
            last_name: '吉崎',
            first_name: '泰雅',
            nickname: 'ヨッシー',
            toeic_score: '805',
            admin: true
        },
        {   id: '2',
            password: '222222',
            email: 'test2@test.com',
            last_name: '大泉',
            first_name: '洋',
            nickname: '洋ちゃん',
            toeic_score: '900',
        }
    ]
)

100.times do |number|
    User.create(
        id:
        name: Faker::DragonBall.character,
        email: Faker::Internet.email,
        postcode: Faker::Address.postcode,  #integer
        address: Faker::Address.city,
     )
end