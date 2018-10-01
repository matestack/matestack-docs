class ApplicationController < ActionController::Base
  protect_from_forgery
  include Basemate::Ui::Core::ApplicationHelper
end
