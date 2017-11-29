# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'testing@gmail.com', password: 'password')
User.create(email: 'abc@gmail.com', password: 'password')

Note.create(user_id: 1, title: 'Test1', body: 'Hello there')
Note.create(user_id: 1, title: 'Test2', body: 'The angel of my nightmare')
Note.create(user_id: 2, title: 'Taylor', body: 'We were both young when i first met you')
