class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index_impl
    page = 0
    page = params[:p].to_i if(params[:p])
    if(params[:s]) then
      @contacts=Contact.search(params[:s], page)
    elsif(params[:date_event_id])
      @contacts = DateEvent.find(params[:date_event_id]).contacts_list
      @date_event = DateEvent.find(params[:date_event_id])
   else
      @contacts = Contact.basic_page(page)
    end

  end
  # GET /contacts
  # GET /contacts.json
  def index
      index_impl

     respond_to do |format|
      format.html {
        if(@contacts.size == 1)
          redirect_to contact_path(@contacts.first) 
        end
      }
      format.json { render json: @contacts }
    end
  end

  def all
      @contacts = Contact.basic
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  def sub
    index_impl
    respond_to do |format|
      format.html { render partial:'sub', layout: false }
      format.json { render json: @contacts }
    end
  end

  def sub_date_event
    index_impl
    respond_to do |format|
      format.html { render partial:'sub_date_event', layout: false }
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(
          :first_name, :last_name, :gender, :is_group_or_parish, 
          :facebook_id, :myspace_id, :twitter_id, :graduating_class, :school,
          :birthday, :youth_group_leader, :watched_safe_child_video, :safe_child_video_letter_sent,
          :allergies, :diet_restrictions, :medical, :phone, :fax, :cell, :work_phone,
          address1: [:street, :city, :state, :zipcode])
    end
end
