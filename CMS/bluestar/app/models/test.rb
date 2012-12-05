class Test < ActiveRecord::Base
  attr_accessible :filename, :name
  def uploaded_file=(upload)    
    name =  upload.original_filename
    directory = "pdf"
    self.filename = directory+"/"+name
    
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    end
end
