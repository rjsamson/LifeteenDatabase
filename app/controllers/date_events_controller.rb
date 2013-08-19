class DateEventsController < ApplicationController
  before_action :set_date_event, only: [:show, :edit, :update, :destroy]

  # GET /date_events
  # GET /date_events.json
  def index
    @date_event_types = DateEventType.all_asc
    @date_events = DateEvent.all_desc
end

  # GET /date_events/1
  # GET /date_events/1.json
  def show
  end

  # GET /date_events/new
  def new
    @date_event = DateEvent.new
  end

  # GET /date_events/1/edit
  def edit
  end

  # POST /date_events
  # POST /date_events.json
  def create
    @date_event = DateEvent.new(date_event_params)

    respond_to do |format|
      if @date_event.save
        format.html { redirect_to @date_event, notice: 'Date event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @date_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @date_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_events/1
  # PATCH/PUT /date_events/1.json
  def update
    if params[:contacts]
      params[:contacts].each do |contact_id|
        contact = Contact.find(contact_id)
        @date_event.contacts.delete(contact)
        respond_to do |format|
          format.html { redirect_to date_event_contacts_url }
          format.json { head :no_content }
        end
      end
    end
    respond_to do |format|
      if @date_event.update(date_event_params)
        format.html { redirect_to @date_event, notice: 'Date event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @date_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_events/1
  # DELETE /date_events/1.json
  def destroy
    @date_event.destroy
    respond_to do |format|
      format.html { redirect_to date_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_event
      @date_event = DateEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_event_params
      params.require(:date_event).permit(:event_date, :date_event_type_id)
    end
end
