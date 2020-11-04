class DocsAppController < ApplicationController
  matestack_app Docs::App

  def core_start
    render Docs::Pages::Core::Start
  end

  def core_ui_components
    render Docs::Pages::Core::UiComponents
  end

  def core_reactive_components
    render Docs::Pages::Core::ReactiveComponents
  end

  def core_reactive_apps
    render Docs::Pages::Core::ReactiveApps
  end

  def core_api
    render Docs::Pages::Core::Api
  end


end
