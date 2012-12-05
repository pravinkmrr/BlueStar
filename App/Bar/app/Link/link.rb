# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Link
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Link.
   enable :sync
  property :links_url, :string
  property :type_id, :int
  property :region_id, :int
  set :sync_priority, 2
  #add model specifc code here
end
