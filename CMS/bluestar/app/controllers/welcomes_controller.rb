class WelcomesController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    @welcomes = Welcome.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @welcomes }
    end
  end

  # GET /welcomes/1
  # GET /welcomes/1.json
  def show
    @welcome = Welcome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @welcome }
    end
  end
 def show_pdf
    @welcome = Welcome.find(params[:id])
    send_data @welcome.pdf, :filename => @welcome.filename, :type => @welcome.content_type , :disposition =>"inline"
  end
  # GET /welcomes/new
  # GET /welcomes/new.json
  def new
    @welcome = Welcome.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @welcome }
    end
  end

  # GET /welcomes/1/edit
  def edit
    @welcome = Welcome.find(params[:id])
  end

  # POST /welcomes
  # POST /welcomes.json
  def create
    @welcome = Welcome.new(params[:welcome])

    @welcome.uploaded_file = params[:welcome][:pdf]
     @welcome.name = params[:welcome][:name]
     @welcome.event_id = params[:welcome][:event_id]
    respond_to do |format|
      if @welcome.save
        format.html { redirect_to @welcome, notice: 'Welcome was successfully created.' }
        format.json { render json: @welcome, status: :created, location: @welcome }
      else
        format.html { render action: "new" }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /welcomes/1
  # PUT /welcomes/1.json
  def update
    @welcome = Welcome.find(params[:id])
    if(params[:welcome][:pdf]!=nil)
       if File.exists?("#{Rails.root}/#{@welcome.pdf}")
      File.delete("#{Rails.root}/#{@welcome.pdf}")
    end
     @welcome.uploaded_file = params[:welcome][:pdf]
      directory = "public/pdf/welcome"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    params[:welcome][:pdf] = directory+"/"+hashed_name + "_" + params[:welcome][:pdf].original_filename.gsub(/\s+/, "")
   end
    respond_to do |format|
      if @welcome.update_attributes(params[:welcome])
        format.html { redirect_to @welcome, notice: 'Welcome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1
  # DELETE /welcomes/1.json
  def destroy
    @welcome = Welcome.find(params[:id])
   if File.exists?("#{Rails.root}/#{@welcome.pdf}")
      File.delete("#{Rails.root}/#{@welcome.pdf}")
    end
    @welcome.destroy

    respond_to do |format|
      format.html { redirect_to welcomes_url }
      format.json { head :no_content }
    end
  end
end