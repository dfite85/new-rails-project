
require 'faker'


10.times do
    users = User.new(
        email: Faker::Internet.email,
        password: Faker::Internet.password,)
    users.save

end

users = User.all


10.times do 
    Wiki.create!(
        title: Faker::LordOfTheRings.character,
        body: Faker::LordOfTheRings.location, )
    
end

wikis = Wiki.all


puts "Seed finished"
puts "#{users.count} users created"
puts "#{wikis.count} wikis created"