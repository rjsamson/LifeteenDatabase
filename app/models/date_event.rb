class DateEvent < ActiveRecord::Base
	has_many :contact, through: :contact_date_event
	belongs_to :date_event_type
	scope :all_desc, -> { all.joins(:date_event_type).order('date_event_types.value asc', event_date: :desc) }
end
