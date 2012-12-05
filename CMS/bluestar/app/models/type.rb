class Type < ActiveRecord::Base
  attr_accessible :type_name
  include Rhoconnect::Resource
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Type.all
  end
end
