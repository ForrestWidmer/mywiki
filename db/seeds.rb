require 'faker'
 
categories = []
6.times do
  categories << Category.create(
    name: Faker::Lorem.words(rand(1..2)).join(" "),
    description: Faker::Lorem.paragraph(rand(1..2))
    )
end
 
rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  u.skip_confirmation!
  u.save
 
  # Note: by calling `User.new` instead of `create`,
  # we create an instance of a user which isn't saved to the database.
  # The `skip_confirmation!` method sets the confirmation date
  # to avoid sending an email. The `save` method updates the database.
 
  rand(5..12).times do
    p = u.wikis.create(
      title: Faker::Lorem.words(rand(1..2)).join(" "), 
      body: Faker::Lorem.paragraphs(rand(10..40)).join("\n"),
      category_id: categories.sample.id)
    # set the created_at to a time within the past year
    p.update_attribute(:created_at, Time.now - rand(600..31536000))
 
    rand(3..7).times do
      p.discussions.create(
        body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
    end
  end
end
 
u = User.first
u.skip_reconfirmation!
u.update_attributes(email: 'fwid77@gmail.com', password: 'helloworld', password_confirmation: 'helloworld')
puts categories.sample.id

u = User.new(
  name: 'Admin User',
  email: 'admin@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'admin')

u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save
u.update_attribute(:role, 'moderator')

u = User.new(
  name: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
u.skip_confirmation!
u.save

puts "Seed finished"
puts "#{Category.count} categories created"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Discussion.count} discussions created"