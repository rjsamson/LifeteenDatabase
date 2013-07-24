class ContactDateEvent < ActiveRecord::Base
	belongs_to :contact
	belongs_to :date_event
end
