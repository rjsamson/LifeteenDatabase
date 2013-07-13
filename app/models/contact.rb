class Contact < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	belongs_to :address1, foreign_key: "address1_id", class_name: "Address"
	belongs_to :address2, foreign_key: "address2_id", class_name: "Address"
	belongs_to :college_address, foreign_key: "college_address_id", class_name: "Address"

	def self.search(search)
		search_string = '%'+ search.to_s + '%'
  		where("(first_name  || ' ' || last_name) LIKE ? OR first_name like ? OR last_name like ?", search_string, search_string, search_string)
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
