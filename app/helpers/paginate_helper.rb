module PaginateHelper

	def will_paginate(pages)
		prev_page = link_to 'Previous', "?page=#{params[:page].to_i - 1}"
		next_page = link_to 'Next', "?page=#{params[:page].to_i + 1}"
		content_tag(:div, class: 'paginate') do
			content_tag(:li) { prev_page } +
			content_tag(:li) { next_page }
		end
	end
end
