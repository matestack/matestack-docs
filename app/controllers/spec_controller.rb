class SpecController < ApplicationController

  layout "docs"

  def resolve
    responder_for(Pages::Spec::GithubDoc)
  end


end
