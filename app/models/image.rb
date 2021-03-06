class Image < ActiveRecord::Base
	has_one :contact
	validates :bytes, :filename, :filetype, presence: true

	def set_bytes(input_data)
		if(input_data)
	    	self.filename = input_data.original_filename
	    	self.filetype = input_data.content_type.chomp
	    	self.bytes = input_data.read
	    end
  	end
end