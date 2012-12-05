class Advertisement < ActiveRecord::Base
    include Rhoconnect::Resource
    belongs_to :event
    has_one :event
    attr_accessible :filename, :image, :event_id_id, :link
    def partition
        :app
    end
    
    def self.rhoconnect_query(partition)
    Advertisement.all
end
def uploaded_file=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    directory = "public/pdf/ads"
    self.image = "http://216.68.72.80:3000/pdf/ads/"+ hashed_name + "_" + name
    self.filename = directory+"/"+ hashed_name +"_"+name
    # create the file path
    path = Rails.root.join(directory, hashed_name +"_"+name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
end
end
