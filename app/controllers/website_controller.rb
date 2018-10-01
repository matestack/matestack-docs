class WebsiteController < ApplicationController

  def home
    @foo = "foo"
    @bar = "bar"
    puts page_1_path
    responder_for(Website::Home)
  end

  def page_1
    @foo = "foo"
    @bar = "bar"
    responder_for(Website::Page1)
  end

  def page_2
    @foo = "foo"
    @bar = "bar"
    responder_for(Website::Page2)
  end

end
