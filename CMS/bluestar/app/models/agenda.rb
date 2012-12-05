class Agenda < ActiveRecord::Base
  include Rhoconnect::Resource
  belongs_to :event
  has_one :event
  attr_accessible :filename, :name, :pdf, :type , :event_id
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Agenda.all
  end
 
   def update_file=(id)
  	self.name=id
  end
    
  def uploaded_file=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    directory = "public/pdf/agendas"
    self.filename = "http://72.167.49.66:3000/pdf/agendas/"+ hashed_name + "_" + name
    self.content_type = upload.content_type
    self.pdf = directory+"/"+ hashed_name +"_"+name
    # create the file path
    path = Rails.root.join(directory, hashed_name +"_"+name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    end
end