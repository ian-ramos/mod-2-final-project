# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Entertainer.create(username: "jonopens", job_type: "Magician", image: 'http://media.gettyimages.com/photos/1960s-man-magician-wearing-picture-id563941525', rate: '25', description: 'so much magic.', password: "password")
Entertainer.create(username: "ianramos", job_type: "Animal Tamer", image: 'https://openclipart.org/image/2400px/svg_to_png/218951/animaltrainer.png', rate: '25', description: 'I can tame lions n stuff.', password: "password")
Entertainer.create(username: "ryansperzel", job_type: "Clown", image: 'http://s.hswstatic.com/gif/how-clowns-work-orig.jpg', rate: '25', description: 'balloon animals are sweet.', password: "password")
Entertainer.create(username: "asheaust", job_type: "Magician", image: 'https://avatars.githubusercontent.com/u/27021764', rate: '50', description: 'watch me split this keyboard in half!', password: "password")
Host.create(username: "spiderman", password: "password")
Host.create(username: "green-goblin", password: "password")
Host.create(username: "venom", password: "password")
Event.create(name: "Old guys playing bocce", description: "It's old guys playing bocce.", host_id: 1, date: Time.now, duration: "4.5")
Event.create(name: "Nerds reading comics", description: "It's nerds reading comics.", host_id: 3, date: Time.now, duration: "3")
EventsEntertainer.create(event_id: 1, entertainer_id: 3)
EventsEntertainer.create(event_id: 1, entertainer_id: 2)
EventsEntertainer.create(event_id: 1, entertainer_id: 1)
EventsEntertainer.create(event_id: 2, entertainer_id: 3)
EventsEntertainer.create(event_id: 2, entertainer_id: 2)
EventsEntertainer.create(event_id: 2, entertainer_id: 1)
Message.create(title:"Wanna hang out?", content:"Hey, did you wanna hangout?", host_id: 1, entertainer_id: 1, sender: "spiderman", receiver: "jonopens")
Message.create(title:"Wanna hang out?", content:"Hey, did you wanna hangout?", host_id: 1, entertainer_id: 2, sender: "spiderman", receiver: "ianramos")
Message.create(title:"Wanna hang out?", content:"Hey, did you wanna hangout?", host_id: 1, entertainer_id: 3, sender: "spiderman", receiver: "ryansperzel")
Message.create(title:"Questions", content:"Hey, I had some questions about your party", host_id: 3, entertainer_id: 1, sender: "jonopens", receiver: "venom")
Message.create(title:"Questions", content:"Hey, I had some questions about your party", host_id: 3, entertainer_id: 2, sender: "ianramos", receiver: "venom")
Message.create(title:"Questions", content:"Hey, I had some questions about your party", host_id: 3, entertainer_id: 3, sender: "ryansperzel", receiver: "venom")
