require 'faker'

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
