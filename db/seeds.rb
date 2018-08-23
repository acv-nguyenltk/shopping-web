2.times do
  category = Category.create(name: 'nameCategory')
  20.times do
    Product.create(name: 'nameProduct', description: 'bao oi', price: 12.22, published: true, category: category)
  end
end
