class DemosController < ApplicationController

  layout "demos"

  def start
    responder_for(Pages::Demos::Start)
  end

  def action_demo
    if DemoUser.count == 0
      DemoUser.create([{name: "Jonas"}, {name: "Pascal"}, {name: "Christopher"}])
    end
    responder_for(Pages::Demos::ActionDemo)
  end

  def form_demo
    if DemoUser.count == 0
      DemoUser.create([{name: "Jonas"}, {name: "Pascal"}, {name: "Christopher"}])
    end
    responder_for(Pages::Demos::FormDemo)
  end


end
