# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.count==0
    User.create(username:"admin",email:"admin@gmail.com",password: "password",password_confirmation:"password",admin: true)
    User.create(username:"user",email:"user@gmail.com",password: "password",password_confirmation:"password",admin: false)

end

if Store.count==0
    Store.create(name:"Test Store",location:"Test Store",user_id:2,domain:"teststore")
end

if Barber.count==0
    Barber.create(first_name:"Jack",last_name:"Jones",store_id:1)
    Barber.create(first_name:"John",last_name:"Doe",store_id:1)
end

if HairStyle.count==0
    HairStyle.create(name:"Skin Fade",duration:20)
    HairStyle.create(name:"Buzz Cut",duration:10)
end
if Availability.count==0
    Availability.create(barber_id:1,start:'Sat Aug 13 2022 16:59:54 GMT+1000 (Australian Eastern Standard Time)',end:'Sat Aug 13 2022 17:59:54 GMT+1000 (Australian Eastern Standard Time)')
    Availability.create(barber_id:1,start:'Sat Aug 13 2022 17:59:54 GMT+1000 (Australian Eastern Standard Time)',end:'Sat Aug 13 2022 18:59:54 GMT+1000 (Australian Eastern Standard Time)')
    Availability.create(barber_id:2,start:'Sat Aug 13 2022 16:59:54 GMT+1000 (Australian Eastern Standard Time)',end:'Sat Aug 13 2022 17:59:54 GMT+1000 (Australian Eastern Standard Time)')
    Availability.create(barber_id:2,start:'Sat Aug 13 2022 17:59:54 GMT+1000 (Australian Eastern Standard Time)',end:'Sat Aug 13 2022 18:59:54 GMT+1000 (Australian Eastern Standard Time)')
end
if Client.count==0
    Client.create(first_name:"Jack",last_name:"Jones",phone:'0412345678',email:'jackjones@gmail.com',store_id:1)
    Client.create(first_name:"Jack",last_name:"Jones",phone:'0412345678',email:'jackjones@gmail.com',store_id:1)
end

if Booking.count==0
    Booking.create(store_id:1,barber_id:1,availability_id:1,hair_style_id:1,client_id:1)
    Booking.create(store_id:1,barber_id:2,availability_id:3,hair_style_id:2,client_id:2)

end

if Domain.count==0
    Domain.create(name:"test",store_id:1)
end













