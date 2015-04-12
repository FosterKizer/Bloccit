class FavoriteMailer < ApplicationMailer
	default from: "kizer713@gmail.com"
	
	def new_comment(user, post, comment)
		
		# New Headers
		headers["Message-ID"] = "<comments/#{comment.id}@fosterk-bloccit.example>"
		headers["In-Reply-To"] = "<post/#{post.id}@fosterk-bloccit.example>"
		headers["References"] = "<post/#{post.id}@fosterk-bloccit.example>"
		
		@user = user
		@post = post
		@comment = comment
		
		mail(to: user.email, subject: "New comment on #{post.title}")
	end
end
