class Ministry < ActiveRecord::Base
	validates_presence_of :value
	attr_accessible :value
end
