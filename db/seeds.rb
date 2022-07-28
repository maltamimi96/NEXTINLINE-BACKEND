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

if Client.count==0
    Client.create(first_name:"Bald",last_name:"Man",phone:"12345678",email:"baldman@gmail.com",store_id:1)
    Client.create(first_name:"Hairy",last_name:"Kid",phone:"87654321",email:"hairykid@gmail.com",store_id:1)
end

if Client.count==0
    Client.create(first_name:"Bald",last_name:"Man",phone:"12345678",email:"baldman@gmail.com",store_id:1)
    Client.create(first_name:"Hairy",last_name:"Kid",phone:"87654321",email:"hairykid@gmail.com",store_id:1)
end

if HairStyle.count==0
    HairStyle.create(name:"skin fade",duration:25)
    HairStyle.create(name:"buzz cut",duration:20)
end


if Availability.count==0
    Availability.create(available_at:"1:00",barber_id:1)
    Availability.create(available_at:"1:00",barber_id:2)
end


if Booking.count==0
    Booking.create(store_id:1,barber_id:1,availability_id:1,client_id:1,hair_style_id:1)
    Booking.create(store_id:1,barber_id:1,availability_id:2,client_id:1,hair_style_id:2)

end








