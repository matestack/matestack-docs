A Single Page Application (SPA) usually is loaded once and handles all user
interactions dynamically by calling backend APIs. This gives the user the
ofted desired "app-feeling". Rails View Layer only offers the static request/response
mode to render content. Basemate fixes that without adding the complexity a
SPA written in JavaScript usually brings with it. Basemate's app instance simply
performs dynamic transitions between pages. You only have to follow the basic
structure to get this running:

## 1. Setup your basemate pages

First of all we need at least two basemate pages:

Your routes:

config/routes.rb

```ruby
Rails.application.routes.draw do
  get '/home', to:'website#home'
  get '/about_us', to:'website#about_us'
end
```

Your Application Layout:

app/views/layouts/application.html.erb

```erb
<!-- somewhere in your body tag -->
<div id="basemate_ui">
  <%= yield %>
</div>
```
Note: Wrap your classic 'yield' with a div and assign the id "basemate_ui"

Your Controller Actions:

app/controllers/tasks_controller.rb

```ruby
class WebsiteController < ApplicationController

  include Basemate::Ui::Core::ApplicationHelper

  def home
    # use a basemate page as response
    responder_for(Pages::Website::Home)
  end

  def about_us
    # use a basemate page as response
    responder_for(Pages::Website::AboutUs)
  end

end
```

Now we define our basemate pages:

app/basemate/pages/website/home.rb

```ruby
class Pages::Website::Home < Page::Cell::Page

  def response
    components {
      div do
        span do
          plain "This is Home!"
        end
      end
    }
  end

end
```

and

app/basemate/pages/website/about_us.rb

```ruby
class Pages::Website::AboutUs < Page::Cell::Page

  def response
    components {
      div do
        span do
          plain "This is about us!"
        end
      end
    }
  end

end
```

Note: The page class name has to match the folder structure and file name

## 2. Setup a basemate app
Now we have to add a basemate app. A basemate app simply defines a layout and
wraps multiple pages within itself:

app/basemate/apps/website.rb

```ruby
class Apps::Website < App::Cell::App

  # define your layout within the response function of your app
  def response
    components {
      header do
        img path: "logo.png"
      end
      nav do
        # perform a dynamic transition to a different page
        # the links get the class "active" when their path is active
        transition path: "/home", text: "Home", class: "nav-link"
        transition path: "/about_us", text: "About Us", class: "nav-link"
      end
      main do
        # this core component includes the current page into the main section
        page_content
      end
    }
  end

end
```

Note: The app's name has to match the namespace of your basemate page:

- Pages::**Website**::Home
- Pages::**Website**::AboutUs

Clicking on the transition links will perform a dynamic transition and change the
content without doing a full page reload.

You can see this in action when navigating through our guides. The links on the
sidebar of the doc articles are transition components.

## Summary

We've implemented a dynamic SPA with a few lines of Ruby. No JavaScript was required.
On the next guide, we will learn how to add some custom UI Sugar in order to perform
a smooth page transition!
