# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Collection.destroy_all
Link.destroy_all

hash_users = 10.times.map do
  {
    login: FFaker::InternetSE.login_user_name,
    password: FFaker::InternetSE.password,
    name: FFaker::InternetSE.user_name,
    email: FFaker::InternetSE.safe_email
  }
end
users = User.create! hash_users

hash_collections = 20.times.map do
  {
    name: FFaker::CheesyLingo.title,
    url: FFaker::InternetSE.password,
    comment: FFaker::CheesyLingo.sentence,
    user: users.sample
  }
end
collections = Collection.create! hash_collections

hash_links = 100.times.map do
  {
    name: FFaker::CheesyLingo.title,
    url: FFaker::InternetSE.http_url,
    comment: FFaker::CheesyLingo.sentence,
    collection: collections.sample
  }
end
links = Link.create! hash_links
