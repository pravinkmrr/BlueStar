class MapsController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

    # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maps }
    end
  end
 def show_pdf
    @map = Map.find(params[:id])
    send_data @map.pdf, :filename => @map.filename, :type => @map.content_type , :disposition =>"inline"
  end
  # GET /maps/1
  # GET /maps/1.json
  def show
    @map = Map.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map }
    end
  end

  # GET /maps/new
  # GET /maps/new.json
  def new
    @map = Map.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map }
    end
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(params[:map])
    @map.uploaded_file = params[:map][:pdf]
     @map.name = params[:map][:name]
     @map.event_id = params[:map][:event_id]
    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render json: @map, status: :created, location: @map }
      else
        format.html { render action: "new" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maps/1
  # PUT /maps/1.json
  def update
    @map = Map.find(params[:id])
    if(params[:map][:pdf]!=nil)
      if File.exists?("#{Rails.root}/#{@map.pdf}")
      File.delete("#{Rails.root}/#{@map.pdf}")
    end
     @map.uploaded_file = params[:map][:pdf]
     directory = "public/pdf/maps"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    params[:map][:pdf] = directory+"/"+hashed_name + "_" + params[:map][:pdf].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map = Map.find(params[:id])
	if File.exists?("#{Rails.root}/#{@map.pdf}")
      File.delete("#{Rails.root}/#{@map.pdf}")
    end
    @map.destroy

    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end
end