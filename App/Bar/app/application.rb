require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    # SyncEngine::set_objectnotify_url(-1, "/app/Settings/sync_notify", '')
    SyncEngine.login("bsapp", "password","" )
    SyncEngine.dosync
    SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
  end
  def on_ui_created 
    SyncEngine.dosync
    super
  end
  def on_activate_app
    SyncEngine.dosync
  end
end
