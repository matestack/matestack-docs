class GuidesController < ApplicationController

  layout "docs"

  def resolve
    responder_for(Pages::Guides::GithubDoc)
  end


end
