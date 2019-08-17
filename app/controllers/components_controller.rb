class ComponentsController < ApplicationController

  layout "docs"

  def resolve
    responder_for(Pages::Components::GithubDoc)
  end


end
