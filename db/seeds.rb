15.times do
    Wiki.create!(
        title: Faker::StarWars.character,
        body:  Faker::StarWars.quote
    )
end

5.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password
        )
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"