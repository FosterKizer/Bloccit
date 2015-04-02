module ApplicationHelper
	def form_group_tag(errors, &block)
		if errors.any?
			content_tag :div, capture(&block), class: 'form-group has-error'
		else
			content_tag :div, capture(&block), class: 'form-group'
		end
	end
	
	def markdown_to_html(markdown)
		renderer = Redcarpet::Render::HTML.new
		extensions = {fenced_code_blocks: true}
		recarpet = Recarpet::Markdown.new(renderer, extensions)
		(recarpet.render markdown).html_safe
	end
end
