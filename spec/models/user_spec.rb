require 'rails_helper'

describe User do
	
	include TestFactories
	
	describe "#favorited(post)" do
		
		before do
			@user = authenticated_user(email_favorites: true)
			@post = associated_post
		end
			
		it "returns 'nil' if the user has not favorited the post" do
			expect( @user.favorited(@post) ).to be_nil
		end
		
		it "returns the appropriate favorite if it exists" do
			@user.favorites.create(post: @post)
			expect( @user.favorited(@post) ).to_not be_nil
		end
		
		it "returns 'nil' if the user has favorited another post" do
			@post_2 = associated_post(options={ title: "Another Post" })
			@user.favorites.create(post: @post_2)
			expect( @user.favorited(@post) ).to be_nil
		end
	end
end
