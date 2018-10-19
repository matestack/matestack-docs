class GuidesController < ApplicationController

  layout "guides"

  def resolve
    page_class = Object.const_get("Pages::Guides::#{params[:key].camelcase}")

    responder_for(page_class)
  end


end
