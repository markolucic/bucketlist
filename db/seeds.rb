# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


b=Bucket.create!(name: 'Buy Nikon', 
               description: 'd5300 with at least 18-105mm lenses', 
               image_url: 'http://cdn1.expertreviews.co.uk/sites/expertreviews/files/styles/er_main_wide/public/0/52//312621_high.jpg?itok=cWnFLp5R', 
               likes: 1)
u=User.create!(email: "test@test.com",
             password: "123456",
             password_confirmation: "123456")
UserLike.create!(user: u, bucket: b)
