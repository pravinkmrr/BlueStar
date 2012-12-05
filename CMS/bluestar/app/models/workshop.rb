class Workshop < ActiveRecord::Base
  include Rhoconnect::Resource
  attr_accessible :name
  def partition
    :app
  end
  
  def self.rhoconnect_query(partition)
    Workshop.all
  end
  
end
