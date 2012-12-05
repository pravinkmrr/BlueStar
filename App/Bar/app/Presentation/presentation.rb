# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Presentation
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Presentation.
   enable :sync
  property :event_id, :int
  property :workshop_id, :int
  property :name, :string
  property :filename, :blob, :overwrite
  set :sync_priority, 14
  #add model specifc code here
end
