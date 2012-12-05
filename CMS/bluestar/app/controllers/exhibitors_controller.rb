class ExhibitorsController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /exhibitors
  # GET /exhibitors.json
  def index
    @exhibitors = Exhibitor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exhibitors }
    end
  end
 def show_pdf
    @exhibitors = Exhibitor.find(params[:id])
    send_data @exhibitors.pdf, :filename => @exhibitors.filename, :type => @exhibitors.content_type , :disposition =>"inline"
  end
  # GET /exhibitors/1
  # GET /exhibitors/1.json
  def show
    @exhibitor = Exhibitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exhibitor }
    end
  end

  # GET /exhibitors/new
  # GET /exhibitors/new.json
  def new
    @exhibitor = Exhibitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exhibitor }
    end
  end

  # GET /exhibitors/1/edit
  def edit
    @exhibitor = Exhibitor.find(params[:id])
  end

  # POST /exhibitors
  # POST /exhibitors.json
  def create
    @exhibitor = Exhibitor.new

    @exhibitor.uploaded_file = params[:exhibitor][:pdf]
     @exhibitor.name = params[:exhibitor][:name]
     @exhibitor.event_id = params[:exhibitor][:event_id]
    respond_to do |format|
      if @exhibitor.save
        format.html { redirect_to @exhibitor, notice: 'Exhibitor was successfully created.' }
        format.json { render json: @exhibitor, status: :created, location: @exhibitor }
      else
        format.html { render action: "new" }
        format.json { render json: @exhibitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exhibitors/1
  # PUT /exhibitors/1.json
  def update
    @exhibitor = Exhibitor.find(params[:id])
    if(params[:exhibitor][:pdf]!=nil)
     if File.exists?("#{Rails.root}/#{@exhibitor.pdf}")
      File.delete("#{Rails.root}/#{@exhibitor.pdf}")
    end
    @exhibitor.uploaded_file = params[:exhibitor][:pdf]
     directory = "public/pdf/exhibitor"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    params[:exhibitor][:pdf] = directory+"/"+hashed_name + "_" + params[:exhibitor][:pdf].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @exhibitor.update_attributes(params[:exhibitor])
        format.html { redirect_to @exhibitor, notice: 'Exhibitor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exhibitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibitors/1
  # DELETE /exhibitors/1.json
  def destroy
    @exhibitor = Exhibitor.find(params[:id])
   if File.exists?("#{Rails.root}/#{@exhibitor.pdf}")
      File.delete("#{Rails.root}/#{@exhibitor.pdf}")
    end
    @exhibitor.destroy

    respond_to do |format|
      format.html { redirect_to exhibitors_url }
      format.json { head :no_content }
    end
  end
end