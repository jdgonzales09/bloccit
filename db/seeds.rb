require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end


Post.find_or_create_by(title: "This is a test post", body: "This is the body of the test post")
Comment.find_or_create_by(body: "This is a test comment left for testing purposes")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
