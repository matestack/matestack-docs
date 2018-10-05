class DocsController < ApplicationController

  layout "docs"

  def start
    responder_for(Pages::Docs::Start)
  end

  def motivation
    responder_for(Pages::Docs::Motivation)
  end

  def setup_sprockets
    responder_for(Pages::Docs::SetupSprockets)
  end

  def setup_webpacker
    responder_for(Pages::Docs::SetupWebpacker)
  end

  def page_usage
    responder_for(Pages::Docs::PageUsage)
  end

  def app_usage
    responder_for(Pages::Docs::AppUsage)
  end

  def component_usage
    responder_for(Pages::Docs::ComponentUsage)
  end


end
