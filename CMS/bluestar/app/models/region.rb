class Region < ActiveRecord::Base
include Rhoconnect::Resource
  attr_accessible :region_name
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Region.where('id not in (?)',[1,2,3,13])
  end
end