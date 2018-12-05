class BasemateUiCoreChannel < ApplicationCable::Channel

  def subscribed
    stream_from "basemate_ui_core"
  end

end
