class PostPolicy < ApplicationPolicy
	
	class Scope
		attr_reader :user, :scope
		
		def initialize(user, scope)
			@user = user
			@scope = scope
		end
		
		def resolve
			if user.present? && user.admin?
				scope.all
			elsif user.present?
				user.posts
			else
				scope.none
			end
		end
	end
	
	def index?
		true
	end
	
end
