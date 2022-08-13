# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

question_category = ["fiqh","aqeeda"]


if User.count==0
    User.create(username:"tim",email:"s90six@gmail.com",password: "pword1",password_confirmation:"pword1",admin: true)
end

if Store.count==0
    Store.create(name:"Ministry Barbers",location:"219 Miller Rd, Bass Hill NSW 2197",user_id:1)
end

if Barber.count==0
    Barber.create(first_name:"Jack",last_name:"Jones",store_id:1)
    Barber.create(first_name:"John",last_name:"Doe",store_id:1)
end

if HairStyle.count==0
    HairStyle.create(name:"Skin Fade",duration:20)
    HairStyle.create(name:"Buzz Cut",duration:10)

end









