module AuthorizationHelpers
	def define_permission!(user, action, thing)
		Permission.create!(user: user, action: action, thing: thing)
	end
end

Rspec.configure do |c|
	c.include AuthorizationHelpers
end
