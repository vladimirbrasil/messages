module ApplicationHelper
	def display_for(role)
		yield if current_user.in_role?(role)
	end
end
