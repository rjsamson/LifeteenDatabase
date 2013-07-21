class Address < ActiveRecord::Base
	belongs_to :contact
	attr_accessible :street, :city, :state, :zipcode
	def complete
		self.street + " " + self.city + ", " + self.state + " " + self.zipcode
	end
end
