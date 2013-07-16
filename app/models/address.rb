class Address < ActiveRecord::Base
	belongs_to :contact

	def complete
		self.street + " " + self.city + ", " + self.state + " " + self.zipcode
	end
end
