class TestController < ApplicationController

  layout "guides"

  def test
    @tasks = DemoTask.all.order(:id)
  end


end
