class DateEvent < ActiveRecord::Base
	has_many :contact, through: :contact_date_event
	belongs_to :date_event_type
	scope :all_desc, -> { all.joins(:date_event_type).order('date_event_types.value asc', event_date: :desc) }
	validates :event_date, :date_event_type_id, presence: true
	has_many :contact_date_events
	has_many :contacts, through: :contact_date_events
	attr_accessible :event_date, :date_event_type_id, :contacts, :contacts_list

	def contacts_list
		contacts.order([last_name: :asc, first_name: :asc])
	end
end
