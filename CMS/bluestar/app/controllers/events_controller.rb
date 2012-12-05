class EventsController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events}
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  def show_image
    @event = Event.find(params[:id])
    send_data @event.logo, :filename => @event.filename, :type => @event.content_type , :disposition =>"inline"
  end


  # POST /events
  # POST /events.json
  def create
    @event = Event.new    
    @event.uploaded_file = params[:event][:logo]
    @event.uploaded_logo = params[:event][:right_file]
     @event.name = params[:event][:name]
@event.region_id = params[:event][:region_id]
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @event.name = params[:event][:name]
    if params[:event][:right_file]!=nil
#    if File.exists?("#{Rails.root}/#{@event.right_file}")
#      File.delete("#{Rails.root}/#{@event.right_file}")
#    end
    directory = "public/pdf/logo"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
     @event.uploaded_logo = params[:event][:right_file]
     params[:event][:right_file] = directory+"/"+hashed_name + "_" + params[:event][:right_file].original_filename.gsub(/\s+/, "");
    end
   if(params[:event][:logo]!=nil) 
   if File.exists?("#{Rails.root}/#{@event.logo}")
      File.delete("#{Rails.root}/#{@event.logo}")
    end
    directory = "public/pdf/logo"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
     @event.uploaded_file = params[:event][:logo]
     params[:event][:logo] = directory+"/"+hashed_name + "_" + params[:event][:logo].original_filename.gsub(/\s+/, "");
     #params[:event][:logo] = params[:event][:logo].original_filename;
   end
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
      if File.exists?("#{Rails.root}/#{@event.logo}")
        File.delete("#{Rails.root}/#{@event.logo}")
      end
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end