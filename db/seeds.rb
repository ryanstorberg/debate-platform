require 'faker'

10.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
end

10.times do
  Topic.create(name: Faker::Lorem.word)
end

20.times do
  Debate.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraph, topic_id: rand(1..10), user_id: rand(1..10), votes_for: rand(1..50), votes_against: rand(1..50))
end

200.times do
  Comment.create(user_id: rand(1..10), debate_id: rand(1..10), content: Faker::Lorem.paragraph, agree: [true, false].sample, vote_count: rand(1..100))
end

5.times do
  Vote.create(has_voted?: [true, false].sample, user_id: rand(1..10), comment_id: rand(1..200))
 end

