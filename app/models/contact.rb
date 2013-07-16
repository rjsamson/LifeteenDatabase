class Contact < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
#	belongs_to :address1, foreign_key: "address1_id", class_name: "Address"
#	belongs_to :address2, foreign_key: "address2_id", class_name: "Address"
#	belongs_to :college_address, foreign_key: "college_address_id", class_name: "Address"
	has_one :address1
	has_many :catechetical_experience
  	accepts_nested_attributes_for :address1, :allow_destroy => true
 #	after_initialize do
 #   	self.address1 ||= self.build_address1()
 # 	end
	
	def self.search(search)
		search_string = '%'+ search.to_s + '%'
  		where("(lower(first_name  || ' ' || last_name)) LIKE lower(?) OR lower(first_name) like lower(?) OR lower(last_name) like lower(?)", search_string, search_string, search_string)
	end
	def pic_url
		if self.facebook_id and self.facebook_id.length > 0 then
			"https://graph.facebook.com/"+self.facebook_id+"/picture?type=large"
		else
			"/assets/Contact.png"
		end
	end

	def facebook_url
		if self.facebook_id and self.facebook_id.length > 0 then
			"https://www.facebook.com/"+self.facebook_id
		else
			nil
		end
	end

	def myspace_url
		if self.myspace_id and self.myspace_id.length > 0 then
			"http://www.myspace.com/"+self.myspace_id
		else
			nil
		end
	end

	def twitter_url
		if self.twitter_id and self.twitter_id.length > 0 then
			"https://www.twitter.com/"+self.twitter_id
		else
			nil
		end
	end
end
