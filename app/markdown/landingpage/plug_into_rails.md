`config/routes.rb`

```ruby
Rails.application.routes.draw do

    get 'my_route', to: 'example#my_frist_page', as: 'my_first_page'

end
```

`app/controllers/example_controller.rb`

```ruby
class ExampleController < ApplicationController

  include Matestack::Ui::Core::ApplicationHelper

  def my_first_page
    responder_for(Pages::MyApp::MyFirstPage)
  end


end

```
