# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Region
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Region.
  enable :sync
  property :region_name, :string
  set :sync_priority, 3

  #add model specifc code here
end
