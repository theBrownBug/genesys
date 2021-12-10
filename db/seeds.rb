# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# list of users

users = [
  {
    'first_name' => 'admin',
    'last_name' => 'admin',
    'email' => 'admin@timetabled.com',
    'password' => 'Password_1',
    'user_type' => 0,
    'role_ids' => [2]
  },
  {
    'first_name' => 'product_owner',
    'last_name' => 'product_owner',
    'email' => 'po@timetabled.com',
    'password' => 'Password_1',
    'user_type' => 0,
    'role_ids' => [3]
  },
  {
    'first_name' => 'reporter',
    'last_name' => 'reporter',
    'email' => 'reporter@timetabled.com',
    'password' => 'Password_1',
    'user_type' => 0,
    'role_ids' => [4]
  }
]

# populate the Role model (roles table )
(0..3).each { |role| Role.create(role_type: role) }

users.each do |user_details|
  if user_details.is_a? Hash
    User.create(first_name: user_details['first_name'], last_name: user_details['last_name'], email: user_details['email'], password: user_details['password'], user_type: user_details['user_type'],
                "role_ids": user_details['role_ids'])
  end
end

counter = 0
(1..10).each do |_r|
  is_live_landing = rand(10) < 5
  if is_live_landing
    counter+=1
    Review.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, is_live: rand(10) < 5, likes: rand(1..100), rating: rand(1..5), is_live_landing: is_live_landing , order_no: counter)
  else
    Review.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, is_live: rand(10) < 5, likes: rand(1..100), rating: rand(1..5), is_live_landing: is_live_landing, order_no: nil)
  end
end

(1..10).each do |q|
  Question.create(question: Faker::Lorem.question, popularity: 0, is_live: false)
  Answer.create(question_id: q, answer: Faker::Lorem.paragraph, likes: rand(1..100), rating: rand(1..5))
end

# go through each question and randomly make them live
(1..10).each do |q|
  q = Question.where(id: q).first
  q.is_live = rand(10) < 5
  q.save
end
