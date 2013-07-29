class DateEvent < ActiveRecord::Base
	has_many :contact, through: :contact_date_event
	belongs_to :date_event_type
	scope :all_desc, -> { all.joins(:date_event_type).order('date_event_types.value asc', event_date: :desc) }
	validates :event_date, :date_event_type_id, presence: true
	attr_accessible :event_date, :date_event_type_id
end
