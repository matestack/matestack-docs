class DocsAppController < ApplicationController
  matestack_app Docs::App

  def home
    render Docs::Pages::Home
  end

  def api
    render Docs::Pages::Api
  end

  def components_api
    render Docs::Pages::ComponentsApi
  end

  def api
    render Docs::Pages::BaseApi
  end

  def base_api
    render Docs::Pages::BaseApi
  end

  def guides
    render Docs::Pages::Guides
  end


end
