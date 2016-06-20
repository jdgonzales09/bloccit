require 'random_data'
Post.destroy_all
Comment.destroy_all
Advertisement.destroy_all

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

10.times do
  Advertisement.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  price: rand(5..40)
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
