# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([ { username: 'ZacHazelwood', email: 'email_1@email.com'},
              { username: 'LukePascale', email: 'email_2@email.com'},
              { username: 'ClayAsh', email: 'email_3@email.com'},
              { username: 'OscarSantos', email: 'email_4@email.com'},
              { username: 'MattDeming', email: 'email_5@email.com'},
              { username: 'ColinReinhart', email: 'email_6@email.com'},])
