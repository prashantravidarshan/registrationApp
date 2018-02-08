module UserHelper
	def users_list_options
		# scope = Proc.new { |u| [u.email,u.id] }
		User.all.members.collect{|u| [u.email,u.id] } 
	end
end
