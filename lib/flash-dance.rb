require 'action_controller'
require "flash-dance/version"
require 'flash-dance/controller_helpers'
require 'flash-dance/view_helpers'

# include the ControllerHelpers module into ActionController and the ViewHelpers into ActionView.
# TODO: hooking the modules into the on_load event of the controller and view at init of the app
ActionController::Base.send(:include, FlashDance::ControllerHelpers)
ActionView::Base.send(:include, FlashDance::ViewHelpers)
