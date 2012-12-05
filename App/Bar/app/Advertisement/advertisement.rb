# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Advertisement
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Advertisement.
  enable :sync
  property :image, :blob, :overwrite
    property :event_id_id, :int
    set :sync_priority, 3
  #add model specifc code here
end
