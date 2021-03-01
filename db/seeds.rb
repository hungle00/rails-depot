#---
# Excerpted from "Agile Web Development with Rails 6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails6 for more book information.
#---
# encoding: utf-8

#Product.delete_all
=begin
Product.create!(title: 'Docker for Rails Developers',
  description:
    %{<p>
      <em>Build, Ship, and Run Your Applications Everywhere</em>
      Docker does for DevOps what Rails did for web development—it gives you 
      a new set of superpowers. Gone are “works on my machine” woes and lengthy 
      setup tasks, replaced instead by a simple, consistent, Docker-based 
      development environment that will have your team up and running in seconds. 
      Gain hands-on, real-world experience with a tool that’s rapidly becoming 
      fundamental to software development. Go from zero all the way to production 
      as Docker transforms the massive leap of deploying your app in the cloud 
      into a baby step.
      </p>},
  image_url: 'ridocker.jpg',
  price: 38.00)
# . . .
Product.create!(title: 'Build Chatbot Interactions',
  description:
    %{<p>
      <em>Responsive, Intuitive Interfaces with Ruby</em>
      The next step in the evolution of user interfaces is here. Chatbots 
      let your users interact with your service in their own natural language. Use 
      free and open source tools along with Ruby to build creative, useful, and 
      unexpected interactions for users. Take advantage of the Lita framework’s 
      step-by-step implementation strategy to simplify bot development and 
      testing. From novices to experts, chatbots are an area in which everyone can 
      participate. Exercise your creativity by creating chatbot skills for 
      communicating, information, and fun.
      </p>},
  image_url: 'dpchat.jpg',
  price: 20.00)
# . . .

Product.create!(title: 'Programming Crystal',
  description:
    %{<p>
      <em>Create High-Performance, Safe, Concurrent Apps</em>
      Crystal is for Ruby programmers who want more performance or for 
      developers who enjoy working in a high-level scripting environment. Crystal 
      combines native execution speed and concurrency with Ruby-like syntax, so 
      you will feel right at home. This book, the first available on Crystal, 
      shows you how to write applications that have the beauty and elegance of a 
      modern language, combined with the power of types and modern concurrency 
      tooling. Now you can write beautiful code that runs faster, scales better, 
      and is a breeze to deploy.
      </p>},
  image_url: 'crystal.jpg',
  price: 40.00)
=end
#products = JSON.parse(File.read('data.json'))

#products.each do |product|
#  Product.create!(product.to_h)
#end

=begin
url = 'https://fakestoreapi.com/products'
response = HTTP.get(url)
if response.status.success?
  products = response.parse
else
  puts 'Unable to fetch products'
end

products.map do |product|
  Product.create!(
    title: product["title"],
    description: product["description"],
    image_url: product["image"],
    price: product["price"]
  )
end
=end
User.create!({:email => "admin@gmail.com", :username => "admin", :password => "admin00", :password_confirmation => "admin00", :seller => true })
User.create!({:email => "steve@email.com", :username => "steve", :password => "0123456", :password_confirmation => "0123456" })


# Comment.create!([
#   {product_id: 1, user_id: 1, rating: 3, body: "dated graphics.  Overpriced.  However, the games are awesome."},
#   {product_id: 3, user_id: 1, rating: 4, body: "MARIO!  'nuff Said"},
#   {product_id: 2, user_id: 2, rating: 5, body: "Excellent value for the money."},
#   {product_id: 2, user_id: 1, rating: 5, body: "Love it!"}
# ])