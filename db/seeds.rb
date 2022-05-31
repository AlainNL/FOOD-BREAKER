# require 'open-uri'
# require 'json'

# puts "------------------------------"
# puts "----------Start seed----------"
# puts "------------------------------"
# sleep(1)

# puts "Booking.destroy_all start..."

# Booking.destroy_all

# puts "Booking.destroy_all finish !"


# puts "Event.destroy_all start..."

# Event.destroy_all

# puts "Event.destroy_all finish !"


# puts "User.destroy_all start..."

# User.destroy_all

# puts "User.destroy_all finish !"

# sleep(1)

# puts "User seed start..."

pierre = User.new(email: 'pierre@gmail.com', password: '12345678', first_name: "pierre", last_name: "jean", address: "17 boulevard clemenceau 35000 Rennes", avatar: '', bio: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.")
pierre.photo.attach(io: URI.open("https://source.unsplash.com/random?man"), filename: "pierre.png", content_type: "image/png")
pierre.save!

# sarah = User.new(email: 'sarah@gmail.com', password: '12345678', first_name: "sarah", last_name: "du desert", address: "35 rue kleber 33200 Bordeaux", avatar: '', bio: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.")
# sarah.photo.attach(io: URI.open("https://source.unsplash.com/random?woman"), filename: "sarahh.png", content_type: "image/png")
# sarah.save!

# nicolas = User.new(email: 'nicolas@gmail.com', password: '12345678', first_name: "nicolas", last_name: "petit", address: "4 rue des basques 64200 Bayonne", avatar: '', bio: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.")
# nicolas.photo.attach(io: URI.open("https://source.unsplash.com/random?man"), filename: "nicolas.png", content_type: "image/png")
# nicolas.save!

# louis = User.new(email: 'louis@gmail.com', password: '12345678', first_name: "louis", last_name: "lafonte", address: "60 rue de paradis 75010 Paris", avatar: '', bio: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.")
# louis.photo.attach(io: URI.open("https://source.unsplash.com/random?man"), filename: "louis.png", content_type: "image/png")
# louis.save!

# juliette = User.new(email: 'juliette@gmail.com', password: '12345678', first_name: "juliette", last_name: "Jetaime", address: "6 rue de la jussienne 75002 Paris", avatar: '', bio: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même.")
# juliette.photo.attach(io: URI.open("https://source.unsplash.com/random?woman"), filename: "juliette.png", content_type: "image/png")
# juliette.save!

# puts "user seed finish !"

# sleep(1)

# puts "Event seed start..."

# Event.create(title: 'frendly Parisian Dinner', type: 'Dinner', address: '17 boulevard clemenceau 35000 Rennes', description: "Dinner with friends around cheese and wine", date: "12/06/2022", capacity: 10, user: pierre)

# Event.create(title: 'Brunch on the beach', type: 'Brunch', address: 'plage du solidor 35400 Saint-Malo', description: "Brunch with a view on the beach", date: "15/06/2022", capacity: 8, user: pierre)

# Event.create(title: 'Learn Portuguese Food ', type: 'Cooking Class', address: '17 boulevard clemenceau 35000 Rennes', description: "Portuguese song eat and fun ", date: "28/06/2022", capacity: 5, user: sarah)

# Event.create(title: 'Traditional Dim Sum Cooking Class', type: 'Cooking Class', address: 'Tour eiffel', description: "Learn how to make Dim with friends", date: "13/08/2022", capacity: 6, user: nicolas)


# puts "Event seed finish !"

# sleep(1)

# puts "Booking seed start..."

# Booking.create(nb_guest: "", date: '25 mai', user_id: pierre.id, teacher_id: piere.id )
# Booking.create(date: '25 mai', user_id: sarah.id, teacher_id: sara.id )
# Booking.create(date: '25 mai', user_id: nicolas.id, teacher_id: nico.id )

# puts "Booking seed finish..."

# sleep(1)

# puts "------------------------------"
# puts "----------All Good !----------"
# puts "------------------------------"

# sleep(1)
