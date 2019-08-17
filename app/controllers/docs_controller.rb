class DocsController < ApplicationController

  layout "docs"

  def resolve
    responder_for(Pages::Docs::GithubDoc)
  end


end
