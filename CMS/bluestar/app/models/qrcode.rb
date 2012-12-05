class Qrcode < ActiveRecord::Base
include Rhoconnect::Resource
  attr_accessible :app_name, :device, :link
def partition
        :app
    end
def self.rhoconnect_query(partition)
    Qrcode.all
end

end
