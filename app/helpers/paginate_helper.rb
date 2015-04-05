module PaginateHelper

	def current_page
		params[:page].to_i
	end
	
	def will_paginate(pages)
		prev_page = link_to 'Previous', "?page=#{params[:page].to_i - 1}"
		next_page = link_to 'Next', "?page=#{params[:page].to_i + 1}"
		content_tag(:div, class: 'paginate') do
			if current_page > 0
				content_tag(:li) { prev_page } +
				content_tag(:li) { next_page }
			elsif current_page < 1
				content_tag(:li) { next_page }
			end
		end
	end
end
