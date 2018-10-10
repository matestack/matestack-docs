class ButtonDemoController < ApplicationController

  layout "button_demo"

  def show
    if DemoUser.count == 0
      DemoUser.create([{name: "Jonas"}, {name: "Pascal"}, {name: "Christopher"}])
    end
    responder_for(Pages::ButtonDemo)
  end

  def delete
    user = DemoUser.find params[:id]
    user.destroy
    render status: 200, json: {message: "success"}
  end


end
