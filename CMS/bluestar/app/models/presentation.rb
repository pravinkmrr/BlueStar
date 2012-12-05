class Presentation < ActiveRecord::Base
  include Rhoconnect::Resource
  belongs_to :workshop
  belongs_to :event
  attr_accessible :filename, :name, :workshop_id, :event_id, :pdf
   def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Presentation.all
  end
  
  def uploaded_file=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    directory = "public/pdf/presentation"
    self.filename = "http://216.68.72.80:3000/pdf/presentation/"+ hashed_name + "_" + name
    self.pdf = directory+"/"+ hashed_name +"_"+name
    # create the file path
    path = Rails.root.join(directory, hashed_name +"_"+name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    end
end