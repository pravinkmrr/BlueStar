# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Guide
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Guide.
  enable :sync
  property :name, :string
  property :filename, :blob, :overwrite
  set :sync_priority, 7
  
  #add model specifc code here
end
