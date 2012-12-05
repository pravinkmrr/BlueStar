# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Map
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Map.
  enable :sync
  property :name, :string
  property :filename, :blob, :overwrite
  set :sync_priority, 10
  
  #add model specifc code here
end
