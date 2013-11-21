require 'faker'

rand(10..30).times do
  p = Create.create(title: Faker::Lorem.words(rand(1..10)).join(" "), body: Faker::Lorem.paragraphs(rand(10..40)).join("\n"))
  rand(3..10).times do
    p.discussions.create(body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
  end
end

puts "Seed finished"
puts "#{Create.count} wikis created"
puts "#{Discussion.count} comments in discussion created"