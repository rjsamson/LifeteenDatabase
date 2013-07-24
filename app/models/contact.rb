class Contact < ActiveRecord::Base
	validates :first_name, :last_name, presence: true
	validates_format_of :phone, :cell, :fax, :work_phone, 
    	message: "must be a valid telephone number.",
    	with: /^[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9} *[0-9]{0,5}$/i,
    	multiline: true,
    	allow_blank: true
	validates :graduating_class, allow_blank: true, format: {with: /(19|20)\d{2}/i }

#	belongs_to :address1, foreign_key: "address1_id", class_name: "Address"
#	belongs_to :address2, foreign_key: "address2_id", class_name: "Address"
#	belongs_to :college_address, foreign_key: "college_address_id", class_name: "Address"
	has_one :address1
	has_one :address2
	has_one :college_address
	has_many :catechetical_experience
	has_many :date_events, through: :contact_date_events

    attr_accessible :first_name, :last_name, :gender, :is_group_or_parish, 
          :facebook_id, :myspace_id, :twitter_id, :graduating_class, :school,
          :birthday, :youth_group_leader, :watched_safe_child_video, :safe_child_video_letter_sent,
          :allergies, :diet_restrictions, :medical, :phone, :fax, :cell, :work_phone, 
          :address1, :address2, :college_address

  	accepts_nested_attributes_for :address1, :allow_destroy => true
  	accepts_nested_attributes_for :address2, :allow_destroy => true
  	accepts_nested_attributes_for :college_address, :allow_destroy => true

  	belongs_to :image

  	scope :basic, -> { select(@fields).order(@order) }
  	
    @fields = [:id, :first_name, :last_name]
    @limit = 24
    @order = [last_name: :asc, first_name: :asc]

 #	after_initialize do
 #   	self.address1 ||= self.build_address1()
 # 	end

	def as_json(options={})
    	super(options.merge(only: [:id, :first_name, :last_name]))
  	end

  	def self.basic_page(page = 0)
  		offset = page * @limit
  		basic.offset(offset).limit(@limit)
  	end
	def self.search(search, page)
	    offset = page
		search_string = '%'+search+'%'
  		result = basic.where("(lower(first_name  || ' ' || last_name)) LIKE lower(?) OR lower(first_name) like lower(?) OR lower(last_name) like lower(?)", search_string, search_string, search_string).order("last_name asc, first_name asc").offset(page * @limit).limit(@limit)
	end
	def pic_filename
		if self.facebook_pic_url then
			nil
		elsif self.is_group_or_parish
			"app/assets/images/church.png"
		elsif self.gender? and self.gender.starts_with? 'f'
			"app/assets/images/female-silhouette.png"
		else
			"app/assets/images/male-silhouette.png"
		end
	end
	def facebook_pic_url
		if self.facebook_id and self.facebook_id.length > 0 then
			"https://graph.facebook.com/#{self.facebook_id}/picture?type=large"
		else
			nil
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
