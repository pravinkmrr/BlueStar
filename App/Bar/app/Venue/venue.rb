# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Venue
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Venue.
  enable :sync
  property :name, :string
  property :filename, :blob, :overwrite
  set :sync_priority, 6
  
  #add model specifc code here
end
