# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Eicon
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Eicon.
   enable :sync
  property :icon, :string
  property :icon_file, :blob, :overwrite
  property :icon_name, :string
  set :sync_priority, 4
  #add model specifc code here
end
