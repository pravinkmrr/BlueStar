class Link < ActiveRecord::Base
 include Rhoconnect::Resource 
 belongs_to :region
  belongs_to :type
  attr_accessible :links_url,:region_id,:type_id

 
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Link.all
  end

end
