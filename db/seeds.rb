puts "Limpiando la DB..."
Category.destroy_all
User.destroy_all
Order.destroy_all
LineItem.destroy_all
Product.destroy_all

puts "Creando categorias..."
maceteros = Category.create!(
  name: "Maceteros",
  description: "Dale una mirada distinta a tu jardin",
  image_url: "https://images.squarespace-cdn.com/content/v1/558095e4e4b095c5b4d764ee/1602278477469-MY24PKABT9PS1NY97B44/IMG_1650.JPG?format=2500w"
)

pastelon = Category.create!(
  name: "Pastelón",
  description: "Transforma la entrada de tu hogar y al mismo tiempo impactas al mundo",
  image_url: "https://greenbricks.cl/wp-content/uploads/2019/12/KADU.jpg"
)

limpiapies = Category.create!(
  name: "Limpiapies",
  description: "La entrada de la casa con un diseño y producto reciclado",
  image_url: "https://www.qrubber.com.pe/imgmodulo/imagengaleria/106.png?time=1562261424"
)

puts "Creando dos productos para maceteros"
Product.create!(
  name: 'Macetero Verde',
  conent: 'un macetero verde bonito',
  price: 2990,
  category: maceteros,
  image_url: "https://dvp.cl/wp-content/uploads/2016/09/1715100002560-1.jpg"
)

puts "Creando dos productos para pastelon"
producto_pastelon = Product.create!(
  name: 'Pastelón Reciclado',
  conent: 'un pastelón liso bonito',
  price: 3990,
  category: pastelon,
  image_url: "https://vibradosflorencia.cl/images/productos/720-pastelon-liso-40x40-02.png"
)
Product.create!(
  name: 'Pastelón Reciclado Rojo',
  conent: 'un pastelón rojo bonito',
  price: 3990,
  category: pastelon,
  image_url: "https://pastelonescanales.cl/wp-content/uploads/2015/10/Modelo-Serena-Rojo.jpg"
)

puts "Creando dos productos para limpiapies"
Product.create!(
  name: 'Limpiapies Reciclado',
  conent: 'un limpiapies verde y azul bonito',
  price: 1990,
  category: limpiapies,
  image_url: "https://static.wixstatic.com/media/54ff2b_f2c30024f9ee44b29822950272d49375~mv2.jpg/v1/fill/w_1080,h_984,al_c,q_85/54ff2b_f2c30024f9ee44b29822950272d49375~mv2.jpg"
)
producto_limpiapies = Product.create!(
  name: 'Limpiapies Reciclado Rojo',
  conent: 'un limpiapies rojo y negro bonito',
  price: 1990,
  category: limpiapies,
  image_url: "https://cdnx.jumpseller.com/grupo-ciclos/image/11972640/resize/540/540?1623184048"
)

puts "Creando un usuario de prueba"
usuario = User.create!(email: 'test@test.com', password: '123456')


puts "Creando una orden para el usuario de prueba"
order = Order.create!(
  user: usuario,
  status: 'completed',
  total_price: producto_pastelon.price.fractional + producto_limpiapies.price.fractional
)

puts "Creando line items para la orden"
LineItem.create!(
  order: order,
  product: producto_pastelon,
  amount: 1,
  total_price: producto_pastelon.price.fractional
)

LineItem.create!(
  order: order,
  product: producto_limpiapies,
  amount: 1,
  total_price: producto_limpiapies.price.fractional
)
puts "fin"