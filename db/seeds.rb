require 'faker'

Product.destroy_all
Category.destroy_all

tables = ['products', 'categories','users']
start_id = 1

tables.each do |table|
   ActiveRecord::Base.connection.execute(
     "ALTER SEQUENCE #{table}_id_seq RESTART WITH #{start_id}"
   )
end

2.times do
  category = Category.create(name: Faker::FunnyName.name)
  20.times do
    Product.create(
      name: Faker::FunnyName.two_word_name,
      description: 'bao oi',
      price: Faker::Number.decimal(2),
      imgUrl: Faker::Avatar.image,
      published: true,
      category: category)
  end
end
