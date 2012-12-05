class Eicon < ActiveRecord::Base
  attr_accessible :icon, :icon_file, :icon_name
   include Rhoconnect::Resource
  def uploaded_file=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name =  Digest::SHA1.hexdigest(Time.now.to_s)
    directory = "public/pdf/icons"
    self.icon_file = "http://216.68.72.80:3000/pdf/icons/"+hashed_name+ "_" +name
    self.icon = directory+"/"+ hashed_name + "_"+name
    #create the file path
    path = Rails.root.join(directory, hashed_name + "_"+name)
     #write the file
   File.open(path, "wb") { |f| f.write(upload.read) }
    
  
  end
   def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Eicon.all
  end
end