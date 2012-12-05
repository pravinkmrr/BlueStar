class IconsController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /icons
  # GET /icons.json
  def index
    @icons = Icon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @icons }
    end
  end

  # GET /icons/1
  # GET /icons/1.json
  def show
    @icon = Icon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @icon }
    end
  end

  # GET /icons/new
  # GET /icons/new.json
  def new
    @icon = Icon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @icon }
    end
  end

  # GET /icons/1/edit
  def edit
    @icon = Icon.find(params[:id])
  end

  # POST /icons
  # POST /icons.json
  def create
    @icon = Icon.new
    @icon.uploaded_file = params[:icon][:icon]
    @icon.icon_name = params[:icon][:icon_name]
    respond_to do |format|
      if @icon.save
        format.html { redirect_to @icon, notice: 'Icon was successfully created.' }
        format.json { render json: @icon, status: :created, location: @icon }
      else
        format.html { render action: "new" }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /icons/1
  # PUT /icons/1.json
  def update
    @icon = Icon.find(params[:id])
    if(params[:icon][:icon]!=nil)
     if File.exists?("#{Rails.root}/#{@icon.icon}")
      File.delete("#{Rails.root}/#{@icon.icon}")
    end
      @icon.uploaded_file = params[:icon][:icon]
       directory = "public/pdf/icons"
      hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
      params[:icon][:icon] = directory + "/" +hashed_name+"_"+params[:icon][:icon].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @icon.update_attributes(params[:icon])
        format.html { redirect_to @icon, notice: 'Icon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /icons/1
  # DELETE /icons/1.json
 # def destroy
    #@icon = Icon.find(params[:id])
   # if File.exists?("#{Rails.root}/#{@icon.icon}")
  #    File.delete("#{Rails.root}/#{@icon.icon}")
 #   end
#    @icon.destroy

    #respond_to do |format|
     # format.html { redirect_to icons_url }
    #  format.json { head :no_content }
   # end
  #end
  
  def code_image
   @image_data = Icon.find(params[:id])
    send_data @image_data.icon_file, :filename => @image_data.icon_name, :type => "image/jpeg" , :disposition =>"inline"
    
  end
end