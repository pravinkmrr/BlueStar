# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Calender
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Calender.
   enable :sync
   property :title, :string
   property :time, :datetime
   property :date, :timestamp
   property :message, :string
   #add model specifc code here
end
