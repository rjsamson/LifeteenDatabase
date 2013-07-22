class ImageController < ApplicationController
	def show
		@img = Image.find(params[:id])
		send_data(@img.bytes, :type => @img.filetype, :filename => @img.filename,
	      	:disposition => 'inline')
	end
	def index
		if(params[:contact_id])
			@contact = Contact.find(params[:contact_id])
			redirect_to @contact.pic_url
		else
	    	@img = nil
	    end
	end
	def create
		@img = Image.new
		@img.set_bytes params[:bytes]
	   respond_to do |format|
	      if @img.save
	        format.html { redirect_to @img, notice: 'Image was successfully created.' }
	      else
	        format.html { render action: 'index' }
	      end
		end
	end

	def update
		@img = Image.find(params[:id])
		@img.set_bytes params[:bytes]
		@img.save
	end

end
