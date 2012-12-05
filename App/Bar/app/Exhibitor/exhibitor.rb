# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Exhibitor
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Exhibitor.
  enable :sync
  property :filename, :blob, :overwrite
    property :name, :string
    property :event_id, :int
  set :sync_priority, 8
  #add model specifc code here
end
