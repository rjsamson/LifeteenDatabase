class DateEventType < ActiveRecord::Base
	belongs_to :date_event, dependent: :destroy
	attr_accessible :value
	scope :all_asc, -> { all.order(value: :asc) }
end
