require 'open-uri'
require 'json'

puts "------------------------------"
puts "----------Start seed----------"
puts "------------------------------"

sleep(1)

puts "Message.destroy_all start..."
Message.destroy_all
puts "Message.destroy_all end..."

puts "Booking.destroy_all start..."
Booking.destroy_all
puts "Booking.destroy_all finish !"

puts "Chatroom.destroy_all start..."
Chatroom.destroy_all
puts "Chatroom.destroy_all end..."

puts "Event.destroy_all start..."
Event.destroy_all
puts "Event.destroy_all finish !"

puts "User.destroy_all start..."
User.destroy_all
puts "User.destroy_all finish !"

sleep(1)

puts "User seed start..."

pierre = User.new(email: 'pierre@gmail.com', password: '12345678', first_name: "pierre", last_name: "jean", avatar: '', address: "17 boulevard clemenceau 35000 Rennes", bio: "Living in Britanny, I will be delighted to welcome you in my restored farmhouse from the 18th century with a lovely garden.")
pierre.photo.attach(io: URI.open("https://images.unsplash.com/photo-1548372290-8d01b6c8e78c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njl8fG1hbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "pierre.png", content_type: "image/png")
pierre.save!

sarah = User.new(email: 'sarah@gmail.com', password: '12345678', first_name: "sarah", last_name: "Kay", avatar: '', address: "35 avenue kleber 75016 Paris", bio: "American born but located in Lisbon for more than 20 years, I want to share the very best of Portugal, the Portuguese and Portuguese traditional gastronomy and our own special sweets. During dinners or classes we chat about food, tips of my city in a cozy and relaxed environment.")
sarah.photo.attach(io: URI.open("https://images.unsplash.com/photo-1614436163996-25cee5f54290?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d29tYW4lMjBjaGVmfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"), filename: "sarahh.png", content_type: "image/png")
sarah.save!

nicolas = User.new(email: 'nicolas@gmail.com', password: '12345678', first_name: "nicolas", last_name: "cage", avatar: '', address: "4 rue des basques 64200 Bayonne", bio: "Hi ! I'm Nicolas. I love traveling, design, nature, photos, art and cooking of course. I would like to welcome you in my house in the South of France not far from Biarritz. My daughters, my wife and my cats would be happy to welcome you!")
nicolas.photo.attach(io: URI.open("https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFuJTIwaGFuZHNvbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "nicolas.png", content_type: "image/png")
nicolas.save!

louis = User.new(email: 'louis@gmail.com', password: '12345678', first_name: "louis", last_name: "Cartier", avatar: '', address: "60 rue de paradis 75010 Paris", bio: "Parisian journalist and producer, I've been travelling around the World since 1996 and living in France's capital since 2000. I enjoy sharing travel categorys, Paris tips (and food !) with travellers and locals. Let's do it around my table!")
louis.photo.attach(io: URI.open("https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTZ8fG1hbiUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "louis.png", content_type: "image/png")
louis.save!

juliette = User.new(email: 'juliette@gmail.com', password: '12345678', first_name: "juliette", last_name: "Harry", avatar: '', address: "6 rue de la jussienne 75002 Paris", bio: "I'm a Parisian born and raised. I'm a food and history lover. I'm a glutton for cheese, buttery saucy meals, sugary treats and chocolate (but always good quality)! Let's share my passions together!")
juliette.photo.attach(io: URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZnJlbmNoJTIweW91bmclMjBtYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "juliette.png", content_type: "image/png")
juliette.save!

puts "user seed finish !"

sleep(1)

puts "Event seed start..."

pierreEvent = Event.new(title: "Friendly Dinner", category: "Dinner", address: "17 boulevard clemenceau 35000 Rennes", description: "Enjoy a pleasant evening in my cosy appartment in the center of Rennes. You will taste a variety of cheeses, wines (Italian, French and Argentinian), hams and salamis, bread and fruits.", date: "06/06/2022", language: "French", capacity: 6, rating: 4.5, user: pierre)
pierreEvent.photos.attach(io: URI.open("https://images.unsplash.com/photo-1601118964938-228a89955311?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"), filename: "pierreEvent.png", content_type: "image/png")
pierreEvent.save!
chatroom1 = Chatroom.new(event_id: pierreEvent.id)
chatroom1.save!


pierreEvent2 = Event.new(title: "Brunch on the beach", category: "Brunch", address: "Grande plage du sillon 35400 Saint-Malo", description: "Take a gourmet break with a brunch of Brittany ! We can have a chat before over food as French cheese, French charcuterie, bread, pancakes and cider!!", date: "07/06/2022", language: "English", capacity: 8, rating: 4.8, user: pierre)
pierreEvent2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1601325561150-3102333057f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YnJ1bmNoJTIwb24lMjB0aGUlMjBiZWFjaHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"), filename: "pierreEvent2.png", content_type: "image/png")
pierreEvent2.save!
chatroom2 = Chatroom.new(event_id: pierreEvent2.id)
chatroom2.save!


pierreEvent3 = Event.new(title: "French pastries tour", category: "Food Tour", address: "rue du Bac 75007 Paris", description: "Tour to taste a sample of French pastries produced locally. The tour starts near the Bon Marche. You'll visit famous patisseries such as Pierre Herme or Philippe Conticini", date: "08/06/2022", language: "French", capacity: 3, rating: 2.8, user: pierre)
pierreEvent3.photos.attach(io: URI.open("https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFzdHJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "pierreEvent3.png", content_type: "image/png")
pierreEvent3.save!
chatroom3 = Chatroom.new(event_id: pierreEvent3.id)
chatroom3.save!


sarahEvent = Event.new(title: "Learn Portuguese Food", category: "Cooking Class", address: "35 avenue kleber 75016 Paris", description: "Portuguese food, songs and fun! One of my passion is to cook and have friends around my table for a good conversation, great food and delicious wine. Come and enjoy a typical Portuguese dinner with me", date: "09/06/2022", language: "Portuguese", capacity: 4, rating: 4.2, user: sarah)
sarahEvent.photos.attach(io: URI.open("https://images.unsplash.com/photo-1582957736192-2597df8acc99?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBvcnR1Z2FsJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"), filename: "sarahEvent.png", content_type: "image/png")
sarahEvent.photos.attach(io: URI.open("https://images.unsplash.com/photo-1652387411197-2b0e2a92a764?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGlzYm9uJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"), filename: "sarahEventbis.png", content_type: "image/png")
sarahEvent.save!

chatroom4 = Chatroom.new(event_id: sarahEvent.id)
chatroom4.save!

sarahEvent2 = Event.new(title: "Quiche and Crepes Party", category: "Cooking Class", address: "35 avenue kleber 75016 Paris", description: "Come and share with me a typical french cooking class! Here is my menu : French Quiche from my traditional recipe and salad, Cheese tasting platter and sweet crepe with bananas, nutella, honey or whipped cream!", date: "10/06/2022", language: "English", capacity: 4, user: sarah)
sarahEvent2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1608855238293-a8853e7f7c98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlbmNoJTIwcXVpY2hlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"), filename: "sarahEvent2.png", content_type: "image/png")
sarahEvent2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1519676867240-f03562e64548?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZnJlbmNoJTIwY3JlcGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "sarahEvent2bis.png", content_type: "image/png")
sarahEvent2.save!

chatroom4bis = Chatroom.new(event_id: sarahEvent.id)
chatroom4bis.save!

nicolasEvent = Event.new(title: "Dim Sum Cooking Class", category: "Cooking Class", address: "Tour eiffel", description: "Learn how to make Dim with friends: prawn dumplings (Har Gow), Siu Mai (open, steamed pork & prawn dumplings), Gyoza and Jiao Zi", date: "10/06/2022", language: "French", capacity: 6, user: nicolas)
nicolasEvent.photos.attach(io: URI.open("https://images.unsplash.com/photo-1503764654157-72d979d9af2f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80"), filename: "nicolasEvent.png", content_type: "image/png")
nicolasEvent.save!
chatroom5 = Chatroom.new(event_id: nicolasEvent.id)
chatroom5.save!

nicolasEvent2 = Event.new(title: "Pizza Cooking Class", category: "Cooking Class", address: "66, rue de l'arbre sec 75001 Paris", description: "Learn how to make delicious pizza. I will share with you techniques to prepare the doughs, the temperatures and the ingredients to be used to obtain an excellent pizza. Cook and enjoy a variety of pizzas from scratch like Margherita, Napoletana, and Marinara, as well as a dessert", date: "11/06/2022", language: "English", capacity: 4, user: nicolas)
nicolasEvent2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1587085416963-22efba033dd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aXRhbGlhbiUyMHBpenphfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"), filename: "nicolasEvent.png", content_type: "image/png")
nicolasEvent2.save!
chatroom6 = Chatroom.new(event_id: nicolasEvent2.id)
chatroom6.save!

nicolasEvent3 = Event.new(title: "Dinner with friends", category: "Dinner", address: "24, rue des jeuneurs 75002", description: "You will be my special guest! Fond of French food, I will be happy to share my favorite receipes", date: "12/06/2022", language: "French", capacity: 4, user: nicolas)
nicolasEvent3.photos.attach(io: URI.open("https://images.unsplash.com/photo-1543168256-8133cc8e3ee4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZyaWVuZHMlMjBkaW5uZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"), filename: "nicolasEvent.png", content_type: "image/png")
nicolasEvent3.save!
chatroom7 = Chatroom.new(event_id: nicolasEvent3.id)
chatroom7.save!

julietteEvent = Event.new(title: "Indian street food", category: "Food Tour", address: "24, rue des jeuneurs 75002", description: "Enjoy a typical Indian street food experience in a cozy atmosphere in Paris! I recently moved to Paris from Mumbai. I love to cook and even more to share it with people", date: "13/06/2022", language: "Spanish", capacity: 2, user: juliette)
julietteEvent.photos.attach(io: URI.open("https://images.unsplash.com/photo-1625398407796-82650a8c135f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aW5kaWFuJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"), filename: "julietteEvent.png", content_type: "image/png")
julietteEvent.save!
chatroom8 = Chatroom.new(event_id: julietteEvent.id)
chatroom8.save!

julietteEvent2 = Event.new(title: "Italian Dinner in Paris", category: "Dinner", address: "6 rue de la jussienne 75002 Paris", description: "Enjoy a tasty and private experience in Paris around Italian food", date: "14/06/2022", language: "French", capacity: 4, user: juliette)
julietteEvent2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGl0YWxpYW4lMjBmb29kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"), filename: "julietteEvent2.png", content_type: "image/png")
julietteEvent2.save!
chatroom9 = Chatroom.new(event_id: julietteEvent2.id)
chatroom9.save!

julietteEvent3 = Event.new(title: "Seasonal dinner in a beautiful loft", category: "Dinner", address: "6 place du Tertre 75018 Paris", description: "This French dinner is an ode to the seasons: everything is market-fresh, perfectly ripe and served in beautiful china tableware. The ultimate seasonal dinner in an elegant Montmartre loft.", date: "15/06/2022", language: "English", capacity: 4, user: juliette)
julietteEvent3.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556911073-a517e752729c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hlZiUyMGRpbm5lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"), filename: "julietteEvent3.png", content_type: "image/png")
julietteEvent3.save!
chatroom10 = Chatroom.new(event_id: julietteEvent3.id)
chatroom10.save!

puts "Event seed finish !"

sleep(1)

puts "Booking seed start..."

Booking.create(nb_guest: "2", confirmation: true, user_id: sarah.id, event_id: pierreEvent.id )
Booking.create(nb_guest: "3", confirmation: true, user_id: nicolas.id, event_id: pierreEvent.id )
Booking.create(nb_guest: "1", confirmation: true, user_id: louis.id, event_id: pierreEvent2.id )
Booking.create(nb_guest: "1", confirmation: true, user_id: juliette.id, event_id: sarahEvent.id )
Booking.create(nb_guest: "1", confirmation: true, user_id: juliette.id, event_id: pierreEvent3.id )
Booking.create(nb_guest: "1", confirmation: true, user_id: pierre.id, event_id: nicolasEvent2.id )
Booking.create(nb_guest: "1", confirmation: true, user_id: pierre.id, event_id: nicolasEvent3.id )

puts "Booking seed finish..."

sleep(1)

puts "------------------------------"
puts "----------All Good !----------"
puts "------------------------------"

sleep(1)
