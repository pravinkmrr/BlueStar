class EiconsController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /eicons
  # GET /eicons.json
  def index
    @eicons = Eicon.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eicons }
    end
  end

  # GET /eicons/1
  # GET /eicons/1.json
  def show
    @eicon = Eicon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eicon }
    end
  end

  # GET /eicons/new
  # GET /eicons/new.json
  def new
    @eicon = Eicon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eicon }
    end
  end

  # GET /eicons/1/edit
  def edit
    @eicon = Eicon.find(params[:id])
  end

  # POST /eicons
  # POST /eicons.json
  def create
    @eicon = Eicon.new
    @eicon.uploaded_file = params[:eicon][:icon]
    @eicon.icon_name = params[:eicon][:icon_name]
    respond_to do |format|
      if @eicon.save
        format.html { redirect_to @eicon, notice: 'Events Icon was successfully created.' }
        format.json { render json: @eicon, status: :created, location: @icon }
      else
        format.html { render action: "new" }
        format.json { render json: @eicon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eicons/1
  # PUT /eicons/1.json
  def update
    @eicon = Eicon.find(params[:id])
    if(params[:eicon][:icon]!=nil)
     if File.exists?("#{Rails.root}/#{@eicon.icon}")
      File.delete("#{Rails.root}/#{@eicon.icon}")
    end
      @eicon.uploaded_file = params[:eicon][:icon]
       directory = "public/pdf/icons"
      hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
      params[:eicon][:icon] = directory + "/" +hashed_name+"_"+params[:eicon][:icon].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @eicon.update_attributes(params[:eicon])
        format.html { redirect_to @eicon, notice: 'Eicon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eicon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eicons/1
  # DELETE /eicons/1.json
#  def destroy
#    @eicon = Eicon.find(params[:id])
#    if File.exists?("#{Rails.root}/#{@eicon.icon}")
#      File.delete("#{Rails.root}/#{@eicon.icon}")
#    end
#    @eicon.destroy

#    respond_to do |format|
#      format.html { redirect_to eicons_url }
#      format.json { head :no_content }
#    end
#  end
end