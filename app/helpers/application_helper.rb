module ApplicationHelper

	def flash_class(level)
		case level
		when :notice then "info"
		when :error then "error"
		when :alert then "warning"
		end
	end

	def link_helper
		if @item && !@item.nil?
			@item.title
		else
			'Home'
		end
	end

end
