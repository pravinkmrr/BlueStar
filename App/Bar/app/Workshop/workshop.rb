# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Workshop
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Workshop.
   enable :sync
  property :name, :string
  set :sync_priority, 13
  #add model specifc code here
end
