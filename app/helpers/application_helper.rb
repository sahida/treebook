module ApplicationHelper
	# Helper function that adds the class to notice/alert flash messages for proper alert colors.
	def flash_class (type)
		case type
		when :alert
			 "alert-warning"
		when :notice
			 "alert-success"
		else
			 "alert-warning"
		end
	end
end
