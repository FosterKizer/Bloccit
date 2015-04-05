module Paginate

	def paginate(params)
		page = params[:page].to_i
		rel = limit(10).offset(page * 10)
	end		
end
