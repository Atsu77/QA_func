# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!(
  name: 'admin_user',
  email: 'kamnknon@gmail.com',
  password: 'foobar'
)

50.times do
  sample_name = Gimei.kanji
  sample_email = Faker::Internet.email
  User.create!(
    name: sample_name,
    email: sample_email,
    password: 'foobar'
  )
end

TAG_NAMES = %w[Ruby Python JavaScript]

TAG_NAMES.each do |tag_name|
  Tag.create!(
    tag_name: tag_name.to_s
  )
end

User.all.each do |user|
  (1..3).each do |i|
       sample_title = Faker::Lorem.sentence
       sample_body = Faker::Lorem.sentence
       sample_answer = Faker::Lorem.sentence
       user.questions.create!(
         title: sample_title,
         body: sample_body,
         answer: sample_answer,
         tag_ids: i.to_i
       )
     end
end
