require 'faker'

5.times do
  User.create(email: Faker::Internet.email,
              password: 'password')
end

(100).times do
  Note.create(title: Faker::Lorem.word,
              content: Faker::Lorem.sentence(5),
              user_id: User.pluck(:id).sample) #pluck is an active record method that
end                                            #returns an array of only the value(s)
                                               #corresponding to the specified attributes
                                               #i.e., if you re-seed, this will sample from the pool of
                                               #all users when randomply assigning the user_ids for the seeded posts
