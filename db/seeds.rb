require 'faker'

5.times do
  user = User.new(
    username:     Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end

10.times do
  Wiki.create(
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
  )
end

admin = User.new(
  username:     'Admin',
  email:        'admin@example.com',
  password:     'helloworld',
  role:         'admin'
)
admin.skip_confirmation!
admin.save
