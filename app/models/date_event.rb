class DateEvent < ActiveRecord::Base
	has_many :contacts, through: :contact_date_events
end
