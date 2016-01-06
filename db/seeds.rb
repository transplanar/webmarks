# enum topic_type
# topics = {
#   comedy: Topic.create!(title: "comedy"),
#   sex: Topic.create!(title: "sex"),
#   drugs: Topic.create!(title: "drugs"),
#   rock_and_roll:  Topic.create!(title: "rock and roll")
# }

# TODO create user roles
admin = User.create!(email: 'admin@example.com', password: 'password', confirmed_at: Time.now)
member = User.create!(email: 'member@example.com', password: 'password', confirmed_at: Time.now)

topic_arr = [:space, :pancakes, :porridge, :comedy]


# Topic.count.times do
topic_arr.each do |topic|
  _topic = Topic.create!(title: topic.to_s.titleize, user: admin)

  4.times do
  # TODO implement Faker
    # Bookmark.create!(url: "http://cracked.com/", topic: _topic)
    _topic.bookmarks.create!(url: "http://cracked.com/")
    # puts "TOPIC = #{topic}"
  end
end


p "Seed complete"
p "#{User.count} users created"
p "#{Topic.count} topics created"
p "#{Bookmark.count} bookmarks created"
