class AgendasController < ApplicationController
    before_filter :current_user, :only => [:index,:show,:new,:edit,:destroy]

  # GET /agendas
  # GET /agendas.json
  def index
    @agendas = Agenda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agendas }
    end
  end
 def show_pdf
    @agendas = Agenda.find(params[:id])
    send_data @agendas.pdf, :filename => @agendas.filename, :type => @agendas.content_type , :disposition =>"inline"
  end
  # GET /agendas/1
  # GET /agendas/1.json
  def show
    @agenda = Agenda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agenda }
    end
  end

  # GET /agendas/new
  # GET /agendas/new.json
  def new
    @agenda = Agenda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agenda }
    end
  end

  # GET /agendas/1/edit
  def edit
    @agenda = Agenda.find(params[:id])
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(params[:agenda])
    @agenda.uploaded_file = params[:agenda][:pdf]
     @agenda.name = params[:agenda][:name]
     @agenda.event_id = params[:agenda][:event_id]
    respond_to do |format|
      if @agenda.save
        format.html { redirect_to @agenda, notice: 'Agenda was successfully created.' }
        format.json { render json: @agenda, status: :created, location: @agenda }
      else
        format.html { render action: "new" }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agendas/1
  # PUT /agendas/1.json
  def update
    @agenda = Agenda.find(params[:id])
    
    if(params[:agenda][:pdf]!=nil)  
    if File.exists?("#{Rails.root}/#{@agenda.pdf}")
      File.delete("#{Rails.root}/#{@agenda.pdf}")
    end
    @agenda.uploaded_file = params[:agenda][:pdf]
    directory = "public/pdf/agendas"
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    params[:agenda][:pdf] = directory+"/"+hashed_name + "_" + params[:agenda][:pdf].original_filename.gsub(/\s+/, "")
    end
    respond_to do |format|
      if @agenda.update_attributes(params[:agenda])
        format.html { redirect_to @agenda, notice: 'Agenda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda = Agenda.find(params[:id])
    if File.exists?("#{Rails.root}/#{@agenda.pdf}")
      File.delete("#{Rails.root}/#{@agenda.pdf}")
    end
    @agenda.destroy

    respond_to do |format|
      format.html { redirect_to agendas_url }
      format.json { head :no_content }
    end
  end
end