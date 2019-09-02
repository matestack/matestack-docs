class LandingpageController < ApplicationController

  layout "landingpage"

  def home
    responder_for(Pages::Landingpage::Home)
  end

  def rubyconfth
    responder_for(Pages::Landingpage::Rubyconfth)
  end

  def imprint
    responder_for(Pages::Landingpage::Imprint)
  end

  def privacy
    responder_for(Pages::Landingpage::Dataprotection)
  end


end
