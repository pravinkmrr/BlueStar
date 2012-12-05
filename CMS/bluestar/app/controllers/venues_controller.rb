class VenuesController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venues }
    end
  end
  def show_pdf
    @venues = Venue.find(params[:id])
    send_data @venues.pdf, :filename => @venues.filename, :type => @venues.content_type , :disposition =>"inline"
  end
  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(params[:venue])
    @venue.uploaded_file = params[:venue][:pdf]
     @venue.name = params[:venue][:name]
     @venue.event_id = params[:venue][:event_id]
    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render json: @venue, status: :created, location: @venue }
      else
        format.html { render action: "new" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])
    if(params[:venue][:pdf]!=nil)
     if File.exists?("#{Rails.root}/#{@venue.pdf}")
      File.delete("#{Rails.root}/#{@venue.pdf}")
    end
    @venue.uploaded_file = params[:venue][:pdf]
    directory = "public/pdf/venues"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    params[:venue][:pdf] = directory+"/"+hashed_name + "_" + params[:venue][:pdf].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
   if File.exists?("#{Rails.root}/#{@venue.pdf}")
      File.delete("#{Rails.root}/#{@venue.pdf}")
    end
	 @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end
end