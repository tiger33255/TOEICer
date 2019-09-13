# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 users = User.create!(
     [
         {
              last_name: '吉崎',
               first_name: '泰雅',
                email: 'tiger.33255@gmail,com',
                 nickname: 'ヨッシー',
                  toeic_score: '805',
        password: '111111'}])