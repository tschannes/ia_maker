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

	def objects_to_be_passed(items)
		if items.level0s != false
			items.each do |first|
				@first = first
			end
		elsif items.level1s != false
			items.each do |second|
				@second = second
			end
		else items.level2s != false
			items.each do |third|
				@third = third
			end
		end
	end


# private
# def name(name)
# 	items.each do |name|
# 		@name = name
# 	end
# end

end
