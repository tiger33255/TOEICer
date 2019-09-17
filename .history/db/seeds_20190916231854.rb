# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    [
        {   id: '0',
            email: 'test@test.com',
            password: '111111',
            last_name: '吉崎',
            first_name: '泰雅',
            nickname: 'ヨッシー',
            toeic_score: '805',
            admin: true,
        }
    ]
)

100.times do |i|
    Article.create!(
        id: "#{i+1}",
        user_id: "0",
        title: "Title #{i+1}",
        body: "Body #{i+1}",
    )
end



100.times do |i|
    gimei = Gimei.name

    User.create!(
        id: "#{i+1}",
        email: "Test#{i+1}@test.com",
        password: "11111#{i+1}",
        last_name: gimei.last.kanji,
        first_name: gimei.first.kanji,
        nickname: gimei.first.romaji,
        toeic_score: "600",
    )

    Article.create!(
        id: "#{i+1}",
        user_id: "#{i+1}",
        title: "Title #{i+1}",
        body: "Body #{i+1}",
    )
  end