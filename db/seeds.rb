puts "Clearing existing data..."

# Destroy de toute les instances
User.destroy_all()
Category.destroy_all()
Toi.destroy_all()
Post.destroy_all()

puts "Creating users..."

User.create!(email: "test@test.com", password:"azerty", username:"testuser")

24.times do |i|
  User.create!(
    email: "#{Faker::Internet.email}",
    password: "123456",
    username: "#{Faker::Name.name}"
  )
end

puts "#{User.count} users created successfully!"


puts "Creating categories..."

['Cinema', 'Spectacle', 'Litterature', 'Exposition'].each do |category_name|
  Category.create!(name: category_name)
end

puts "#{Category.count} categories created sucessfully!"

def dynamic_content_for_toi(category_id)
  category = Category.find(category_id)
  case category.name
  when "Cinema"
    {
      title: "Film: #{Faker::Movie.title}",
      description: Faker::Lorem.sentence,
      trailer: "https://example.com/trailer#{category_id}"
    }
  when "Spectacle"
    {
      title: "Spectacle: #{Faker::Lorem.sentence(word_count: 3)}",
      description: Faker::Lorem.paragraph,
      trailer: "https://example.com/trailer#{category_id}"
    }
  when "Litterature"
    {
      title: "Livre: #{Faker::Book.title}",
      description: Faker::Lorem.paragraph,
      trailer: ""
    }
  when "Exposition"
    {
      title: "Expo: #{Faker::Lorem.sentence(word_count: 3)}",
      description: Faker::Lorem.paragraph,
      trailer: "https://example.com/trailer#{category_id}"
    }
  else
    { title: "N/A", description: "N/A", trailer: "N/A" }
  end
end

puts "Creating tois..."

24.times do |i|
  category = Category.order('RANDOM()').first
  content = dynamic_content_for_toi(category.id)

  Toi.create!(
    title: content[:title],
    category: category,
    location: Faker::Address.full_address,
    description: content[:description],
    trailer: content[:trailer]
  )
end

puts "#{Toi.count} tois created sucessfully!"

puts "Creating posts..."

24.times do |i|
  user = User.order('RANDOM()').first
  toi = Toi.order('RANDOM()').first

  Post.create!(
    photo: "photo#{i}.jpg",
    review: "Critique numéro #{i}",
    rating: rand(1..10),
    user_id: user.id,
    toi_id: toi.id
  )
end
puts "#{Post.count} posts created sucessfully!"
