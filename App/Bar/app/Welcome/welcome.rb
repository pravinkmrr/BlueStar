# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Welcome
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Welcome.
   enable :sync
  property :name, :string
  property :filename, :blob, :overwrite
  set :sync_priority, 5
  
  #add model specifc code here
end
