class ImageController < ApplicationController
	def index
		if(params[:contact_id])
			@contact = Contact.find(params[:contact_id])
			if(@contact.image)
				send_image(@contact.image)
	      	else
				redirect_to @contact.pic_url
			end
		else
			@img = Image.find(params[:id])
			send_image(@img)
	    end
	end
	def show contact
		"hello"
	end
	def new

	end
	def create
		if(params[:contact_id])
			@contact = Contact.find(params[:contact_id])
			if(@contact.image)
				@contact.image.delete
			end
			@contact.image = Image.new
			@contact.image.set_bytes params[:bytes]
		   respond_to do |format|
		      if @contact.save
		        format.html { redirect_to [@contact], notice: 'Image was successfully created.' }
		      else
		        format.html { render action: 'index', contact: @contact }
		      end
			end
		else
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

	end

	def update
		@img = Image.find(params[:id])
		@img.set_bytes params[:bytes]
		@img.save
	end

	private
		def send_image(img)
			send_data(img.bytes, :type => img.filetype, :filename => img.filename,
	      		:disposition => 'inline')
		end
end
