class Address < ActiveRecord::Base
	belongs_to :contact

	validates :street, :city, :state, :zipcode, presence: true
	validates_length_of :state, minimum: 2, maximum: 2

	attr_accessible :street, :city, :state, :zipcode

	def complete
		self.street + " " + self.city + ", " + self.state + " " + self.zipcode
	end
end
