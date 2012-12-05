# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Icon
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Icon.
  enable :sync
  property :icon_file, :blob, :overwrite
  property :icon_name, :string
  set :sync_priority, 1     
  #add model specifc code here
end
