class Image < ActiveRecord::Base
	def set_bytes(input_data)
    	self.filename = input_data.original_filename
    	self.filetype = input_data.content_type.chomp
    	self.bytes = input_data.read
  	end
end