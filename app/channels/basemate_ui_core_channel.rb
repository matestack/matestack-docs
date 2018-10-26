class BasemateUiCoreChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    stream_from "basemate_ui_core"
  end
end
