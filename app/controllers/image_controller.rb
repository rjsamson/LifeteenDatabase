class ImageController < ApplicationController
	
	def index
		if(params[:contact_id])
			@contact = Contact.select([:id, :image_id, :facebook_id, :is_group_or_parish, :gender]).find(params[:contact_id])
			if(@contact.image)
				send_image_bytes(@contact.image)
	      	elsif @contact.facebook_pic_url
	      		redirect_to @contact.facebook_pic_url
	      	else
	      		filename = @contact.pic_filename
	      		extname = File.extname(filename)[1..-1]
	      		mime_type = Mime::Type.lookup_by_extension(extname)
    			content_type = mime_type.to_s unless mime_type.nil?
	      		send_image_file(open(filename), content_type, filename)
			end
		else
			@img = Image.find(params[:id])
			send_image(@img)
	    end
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
		def send_image_bytes(img)
			send_data(img.bytes, :type => img.filetype, :filename => img.filename,
	      		:disposition => 'inline')
		end
		def send_image_file(img_file, content_type, filename)
			send_data(img_file.read, :type => content_type, :filename => filename,
	      		:disposition => 'inline')
		end
end
