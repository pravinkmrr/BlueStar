class Exhibitor < ActiveRecord::Base
  include Rhoconnect::Resource
  belongs_to :event
  has_one :event
  attr_accessible :filename, :name, :pdf, :type , :event_id
    def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Exhibitor.all
  end
  
  def uploaded_file=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    directory = "public/pdf/exhibitors"
    self.filename = "http://216.68.72.80:3000/pdf/exhibitors/"+ hashed_name + "_"+name
    self.content_type = upload.content_type
    self.pdf = directory+"/"+ hashed_name + "_"+name
    # create the file path
    path = Rails.root.join(directory, hashed_name + "_"+name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    end
end