# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    dominion = Boardgame.create(name: 'Dominion', description: "You are a monarch, like your parents before you, a ruler of a small pleasant kingdom of rivers and evergreens. Unlike your parents, however, you have hopes and dreams! You want a bigger and more pleasant kingdom, with more rivers and a wider variety of trees. You want a Dominion! In all directions lie fiefs, freeholds, and feodums. All are small bits of land, controlled by petty lords and verging on anarchy. You will bring civilization to these people, uniting them under your banner.

        But wait! It must be something in the air; several other monarchs have had the exact same idea. You must race to get as much of the unclaimed land as possible, fending them off along the way. To do this you will hire minions, construct buildings, spruce up your castle, and fill the coffers of your treasury. Your parents wouldn't be proud, but your grandparents, on your mother's side, would be delighted.", category: 'cardgame', manufacturer: 'Rio Grande Games', image_url: 'https://cf.geekdo-images.com/7mkW_JrUx0PSa4Ame3zzsLE0BVY=/fit-in/246x300/pic394356.jpg')


codenames = Boardgame.create(name: 'Codenames', description:"Two rival spymasters know the secret identities of 25 agents. Their teammates know the agents only by their CODENAMES.

            In Codenames, two teams compete to see who can make contact with all of their agents first. Spymasters give one-word clues that can point to multiple words on the board. Their teammates try to guess words of the right color while avoiding those that belong to the opposing team. And everyone wants to avoid the assassin.

            Codenames: Win or lose, it's fun to figure out the clues.", category: 'Party', image_url: 'https://cf.geekdo-images.com/images/pic2582929_md.jpg', manufacturer: 'Czech Games' )


catan = Boardgame.create(name: 'Catan', description:"ruins friendships", category: '4X', image_url: 'https://cf.geekdo-images.com/images/pic2419375_md.jpg', manufacturer: 'Catan Studio ' )


ashlee = User.create(username: 'ashlee', first_name: 'Ashlee', last_name: 'Crusco', password: '123')

josh = User.create(username: 'Jish', first_name: 'Joshua', last_name: 'Denenberg', password: '456')


ashlee.boardgames << codenames
ashlee.boardgames << dominion

josh.boardgames << dominion
josh.boardgames << catan
josh.boardgames << codenames
