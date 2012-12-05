class KeynotesController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /keynotes
  # GET /keynotes.json
  def index
    @keynotes = Keynote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @keynotes }
    end
  end
 def show_pdf
    @keynote = Keynote.find(params[:id])
    send_data @keynote.pdf, :filename => @keynote.filename, :type => @keynote.content_type , :disposition =>"inline"
  end
  # GET /keynotes/1
  # GET /keynotes/1.json
  def show
    @keynote = Keynote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @keynote }
    end
  end

  # GET /keynotes/new
  # GET /keynotes/new.json
  def new
    @keynote = Keynote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @keynote }
    end
  end

  # GET /keynotes/1/edit
  def edit
    @keynote = Keynote.find(params[:id])
  end

  # POST /keynotes
  # POST /keynotes.json
  def create
    @keynote = Keynote.new(params[:keynote])

    @keynote.uploaded_file = params[:keynote][:pdf]
     @keynote.name = params[:keynote][:name]
     @keynote.event_id = params[:keynote][:event_id]
    respond_to do |format|
      if @keynote.save
        format.html { redirect_to @keynote, notice: 'Keynote was successfully created.' }
        format.json { render json: @keynote, status: :created, location: @keynote }
      else
        format.html { render action: "new" }
        format.json { render json: @keynote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /keynotes/1
  # PUT /keynotes/1.json
  def update
    @keynote = Keynote.find(params[:id])
    if(params[:keynote][:pdf]!=nil)
      if File.exists?("#{Rails.root}/#{@keynote.pdf}")
      File.delete("#{Rails.root}/#{@keynote.pdf}")
    end
    @keynote.uploaded_file = params[:keynote][:pdf]
     directory = "public/pdf/keynotes"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    params[:keynote][:pdf] = directory+"/"+hashed_name + "_" + params[:keynote][:pdf].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @keynote.update_attributes(params[:keynote])
        format.html { redirect_to @keynote, notice: 'Keynote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @keynote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keynotes/1
  # DELETE /keynotes/1.json
  def destroy
    @keynote = Keynote.find(params[:id])
	if File.exists?("#{Rails.root}/#{@keynote.pdf}")
      File.delete("#{Rails.root}/#{@keynote.pdf}")
    end
    @keynote.destroy

    respond_to do |format|
      format.html { redirect_to keynotes_url }
      format.json { head :no_content }
    end
  end
end