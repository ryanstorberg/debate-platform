require 'faker'

10.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

topics = [
  "Abortion", "ACLU", "Alternative Energy", "Animal Testing",
  "Climate Change", "Church and State", "College Education",
  "Gun Control", "Cuba Embargo", "Drones", "Gay Marriage",
  "Gold Standard", "Illegal Immigration",
  "Israeli Palestinian Conflict", "Medical Marijuana",
  "Obamacare / Healthcare", "Social Security",
  "Standardized Tests", "Teacher Tenure", "Vaccines for Kids",
  "U.S Foreign Policy", "Poverty"
]

topics.each do |topic|
  Topic.create(name: topic)
end

20.times do
  Debate.create(
    title: Faker::Company.catch_phrase,
    body: Faker::Lorem.paragraph(rand(5..50)),
    topic_id: rand(1..topics.length),
    user_id: rand(1..10)
    # votes_for: rand(1..50),
    # votes_against: rand(1..50))
  )
end

200.times do
  Comment.create(
    user_id: rand(1..9),
    debate_id: rand(1..20),
    content: Faker::Lorem.paragraph,
    agree: [true, false].sample
    # vote_count: rand(1..100))
  )
end

# 500.times do
#   Vote.create(
#     has_voted?: true,
#     agree: [true, false].sample,
#     user_id: rand(1..10),
#     comment_id: rand(1..200)
#   )
#  end

