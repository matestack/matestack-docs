class ApplicationController < ActionController::Base
  protect_from_forgery
  include Matestack::Ui::Core::ApplicationHelper
end
