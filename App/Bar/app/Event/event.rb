# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Event
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Event.
  enable :sync
  property :filename, :blob, :overwrite
  property :right_filename, :blob, :overwrite
  set :sync_priority, 3
  #add model specifc code here
end
