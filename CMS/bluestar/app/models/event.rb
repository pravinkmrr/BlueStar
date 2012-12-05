class Event < ActiveRecord::Base
  include Rhoconnect::Resource
  attr_accessible :filename, :logo, :name, :type, :right_file, :region_id
  has_many :welcome, :dependent => :destroy
  has_many :exhibitor, :dependent => :destroy
  has_many :map, :dependent => :destroy
  has_many :agenda, :dependent => :destroy
  has_many :presentation, :dependent => :destroy
  has_many :guide, :dependent => :destroy
  has_many :keynote, :dependent => :destroy
    #has_many :alert, :dependent => :destroy
  has_many :venues, :dependent => :destroy
  
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Event.all
  end

  def uploaded_logo=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name = Digest::SHA1.hexdigest(Time.now.to_s)  
    directory = "public/pdf/logo"
    self.right_filename =  "http://216.68.72.80:3000/pdf/logo/"+ hashed_name + "_" + name
    #self.filename =  "http://72.167.49.66:3000/pdf/logo/"+ name
    self.right_file = directory+"/"+ hashed_name + "_"+name
    # create the file path
    path = Rails.root.join(directory, hashed_name + "_"+name)
    #path = Rails.root.join(directory,name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    end
  
  def uploaded_file=(upload)
    name =  upload.original_filename.gsub(/\s+/, "")
    hashed_name = Digest::SHA1.hexdigest(Time.now.to_s)  
    directory = "public/pdf/logo"
    self.filename =  "http://216.68.72.80:3000/pdf/logo/"+ hashed_name + "_" + name
    #self.filename =  "http://72.167.49.66:3000/pdf/logo/"+ name
    self.content_type = upload.content_type
    self.logo = directory+"/"+ hashed_name + "_"+name
    # create the file path
    path = Rails.root.join(directory, hashed_name + "_"+name)
    #path = Rails.root.join(directory,name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
    end
end