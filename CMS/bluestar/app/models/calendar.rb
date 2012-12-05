class Calendar < ActiveRecord::Base
    include Rhoconnect::Resource
    belongs_to :event
    has_one :event
  attr_accessible :date, :event_id, :message, :time, :title
    def partition
        :app
    end
    
    def self.rhoconnect_query(partition)
    Calendar.all
end

end
