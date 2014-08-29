require 'faker'

10.times do
  User.create(username: Faker::Lorem.word, email: Faker::Internet.email, password: "password")
end

User.all.each do |u|
  Debate.create(user_id: u.id, title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraph)
end

Debate.all.each do |d|
  rand(2..6).times do
    User.all.each do |u|
      Comment.create(debate_id: d.id, user_id: u.id, content: Faker::Lorem.sentence)
    end
  end
end

