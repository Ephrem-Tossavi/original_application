# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "Ephrem TOSSAVI", email: "ephrem@gmail.com", password: "password", status: "Enseignant", admin: true)
posts = Post.all

posts.each do |post|
    post.update(user_id: User.last.id) 
end

tag = Tag.create(name: "Biologie", user_id: User.last.id)
tag = Tag.create(name: "Agronomie", user_id: User.last.id)
tag = Tag.create(name: "Informatique", user_id: User.last.id)
tag = Tag.create(name: "Mathematiques", user_id: User.last.id)
tag = Tag.create(name: "Sciences Juridique", user_id: User.last.id)
tag = Tag.create(name: "Sciences Physiques", user_id: User.last.id)
tag = Tag.create(name: "Troisième", user_id: User.last.id)
tag = Tag.create(name: "Terminale", user_id: User.last.id)
tag = Tag.create(name: "Licence", user_id: User.last.id)
tag = Tag.create(name: "Master", user_id: User.last.id)

status = ["Elève", "Etudiant", "Enseignant"]

        
(1..5).each do |x|
    User.create(name: "name#{x}", email: "example#{x}@gmail.com", password: "password", status: status.sample, admin: false)
    Post.create(name: "post_title#{x}", content: "content#{x}", attachment: Faker::File.mime_type, user_id: User.last.id )
  
end
