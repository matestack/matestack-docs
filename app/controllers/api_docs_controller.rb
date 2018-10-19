class ApiDocsController < ApplicationController

  layout "api_docs"

  def resolve
    responder_for(Pages::ApiDocs::Start)
  end


end
