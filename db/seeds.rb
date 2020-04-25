# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Card.new {
#   title: '',
#   slot_1: '',
#   slot_2: '',
#   slot_3: '',
#   slot_4: '',
#   slot_5: '',
#   slot_6: '',
#   slot_7: '',
#   slot_8: '',
#   slot_9: '',
#   slot_10: '',
#   slot_11: '',
#   slot_12: '',
#   notes: ''
# }


## Legacy cards

Card.create(title: 'Legacy List 7',
  slot_1: 'fictional characters',
  slot_2: 'menu items',
  slot_3: 'magazines',
  slot_4: 'capitals',
  slot_5: 'kinds of candy',
  slot_6: 'items you save up to buy',
  slot_7: 'footwear',
  slot_8: 'something you keep hidden',
  slot_9: 'items in a suitcase',
  slot_10: 'things with tails',
  slot_11: 'sports equipment',
  slot_12: 'crimes',
  notes: '')

Card.create(title: 'Legacy List 8',
  slot_1: 'things that are sticky',
  slot_2: 'awards/ceremonies',
  slot_3: 'cars',
  slot_4: 'spices/herbs',
  slot_5: 'bad habits',
  slot_6: 'cosmetics/toiletries',
  slot_7: 'celebrities',
  slot_8: 'cooking utensils',
  slot_9: 'reptiles/amphibians',
  slot_10: 'parks',
  slot_11: 'leisure activities',
  slot_12: "things you're allergic to",
  notes: '')
