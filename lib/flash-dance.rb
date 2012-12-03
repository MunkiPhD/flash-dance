require 'action_controller'
require "flash-dance/version"
require 'flash-dance/controller_helpers'

# include the ControllerHelpers module into ActionController
ActionController::Base.send(:include, FlashDance::ControllerHelpers)
