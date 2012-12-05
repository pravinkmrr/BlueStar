class PresentationsController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.find(:all,:order =>"workshop_id ASC, name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @presentations }
    end
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @presentation }
    end
  end

  # GET /presentations/new
  # GET /presentations/new.json
  def new
    @presentation = Presentation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @presentation }
    end
  end

  # GET /presentations/1/edit
  def edit
    @presentation = Presentation.find(params[:id])
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new
 @presentation.uploaded_file = params[:presentation][:pdf]
     @presentation.name = params[:presentation][:name]
     @presentation.event_id = params[:presentation][:event_id]
     @presentation.workshop_id = params[:presentation][:workshop_id]
     respond_to do |format|
      if @presentation.save
        format.html { redirect_to @presentation, notice: 'Presentation was successfully created.' }
        format.json { render json: @presentation, status: :created, location: @presentation }
      else
        format.html { render action: "new" }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /presentations/1
  # PUT /presentations/1.json
  def update
    @presentation = Presentation.find(params[:id])
    if(params[:presentation][:pdf]!=nil)
    if File.exists?("#{Rails.root}/#{@presentation.pdf}")
      File.delete("#{Rails.root}/#{@presentation.pdf}")
    end
    directory = "public/pdf/presentation"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    @presentation.uploaded_file = params[:presentation][:pdf]
    params[:presentation][:pdf] = directory+"/"+hashed_name + "_" + params[:presentation][:pdf].original_filename.gsub(/\s+/, "")

     end    
     @presentation.event_id = params[:presentation][:event_id]
     @presentation.workshop_id = params[:presentation][:workshop_id]
    respond_to do |format|
      if @presentation.update_attributes(params[:presentation])
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation = Presentation.find(params[:id])
    if File.exists?("#{Rails.root}/#{@presentation.pdf}")
      File.delete("#{Rails.root}/#{@presentation.pdf}")
    end
    @presentation.destroy

    respond_to do |format|
      format.html { redirect_to presentations_url }
      format.json { head :no_content }
    end
  end
end