class Address < ActiveRecord::Base
	has_one :contact

	def complete
		self.street + " " + self.city + ", " + self.state + " " + self.zipcode
	end
end
