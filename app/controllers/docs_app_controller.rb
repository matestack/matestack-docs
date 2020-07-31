class DocsAppController < ApplicationController
  matestack_app Docs::App

  def home
    render Docs::Pages::Home
  end

  def api
    render Docs::Pages::Api
  end

  def components
    render Docs::Pages::Components
  end

  def guides
    render Docs::Pages::Guides
  end

  def spec
    render Docs::Pages::Spec
  end

end
