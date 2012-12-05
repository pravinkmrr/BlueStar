class Calender < ActiveRecord::Base
    include Rhoconnect::Resource
    has_one :event
    belongs_to :event
    attr_accessible :date, :event_id, :message, :time, :title
    def partition
        :app
    end
    
    def self.rhoconnect_query(partition)
    Calender.all
end
end
