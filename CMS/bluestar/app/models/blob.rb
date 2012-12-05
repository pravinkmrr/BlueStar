class Blob < ActiveRecord::Base
  include Rhoconnect::Resource
  attr_accessible :content_type, :file, :filename
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Blob.all     
  end
    def uploaded_file=(upload)
    # name =  upload.original_filename
    directory = "public/pdf/agendas"
    self.filename =  upload.original_filename
    self.content_type = upload.content_type
    self.file = upload.read
    # create the file path
    # path = File.join(directory, name)
    # write the file
    # File.open(path, "wb") { |f| f.write(upload.read) }
    end
end