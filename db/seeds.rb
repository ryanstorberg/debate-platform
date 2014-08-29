require 'faker'

10.times do
  User.create(username: Faker::Lorem.word, email: Faker::Internet.email, password: "password")
  Debate.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraph, user_id: 2)
end

User.create(username: "bmpasini", email: "bruno@email.com", password: "password")

Comment.create(content: Faker::Company.catch_phrase, debate: Debate.first, user: User.first, agree: true, vote_count: 1)

Comment.create(content: Faker::Company.catch_phrase, debate: Debate.first, user: User.first, vote_count: 2)

5.times do
  Vote.create(has_voted?: true, user: User.first, comment: Comment.first)
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

