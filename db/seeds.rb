# TODO create user roles
admin = User.create!(email: 'admin@example.com', password: 'password', confirmed_at: Time.now)
User.create!(email: 'member@example.com', password: 'password', confirmed_at: Time.now)
# User.create!(email: Faker::Internet.email, password: 'password', confirmed_at: Time.now)

# topic_arr = [:space, :pancakes, :porridge, :comedy]
topic_arr = []

10.times do
  User.create!(email: Faker::Internet.email, password: 'password', confirmed_at: Time.now)
end

20.times do
  topic_arr.push(Faker::Hipster.word)
end

topic_arr.each do |topic|
  # TODO change to be owned by random users
  _topic = Topic.create!(title: topic.to_s.titleize, user: admin)

  4.times do
    _topic.bookmarks.create!(url: "http://cracked.com/")
  end
end


p "Seed complete"
p "#{User.count} users created"
p "#{Topic.count} topics created"
p "#{Bookmark.count} bookmarks created"
