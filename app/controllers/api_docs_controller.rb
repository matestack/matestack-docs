class ApiDocsController < ApplicationController

  layout "api_docs"

  def resolve
    page_class = Object.const_get("Pages::ApiDocs::#{params[:key].camelcase}Doc")
    responder_for(page_class)
  end

end
