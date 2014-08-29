require 'faker'

10.times do
  Debate.create(title: Faker::Company.catch_phrase, body: Faker::Lorem.paragraph)
end
