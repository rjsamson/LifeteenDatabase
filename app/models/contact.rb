class Contact < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	belongs_to :address1, foreign_key: "address1_id", class_name: "Address"
	belongs_to :address2, foreign_key: "address2_id", class_name: "Address"
	belongs_to :college_address, foreign_key: "college_address_id", class_name: "Address"
end
