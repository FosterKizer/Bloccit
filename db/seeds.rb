require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 unless Post.any? { |s| s[:title] == "Unique Post!" }
	Post.create!(
		title: "Unique Post!",
		body: "This is a unique post in the seed data."
	)
 end
 
 unless Comment.any? { |s| s[:body] == "Unique Comment" }
	Comment.create!(
		post: posts.sample,
		body: "Unique Comment"
	)
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
