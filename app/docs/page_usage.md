## Table of Contents

- [Basemate Page](#basemate-page)
  - [Setup](#basic-page-setup)
  - [Partials](#structure-your-basemate-page-response-with-partials)
  - [Prepare Block](#use-the-prepare-method-to-implement-page-related-business-logic)
  - [Iterators](#use-iterators)

## Basic Page Setup
Scenario: You want to use a basemate Page instead of a classic Rails view as a
response for a controller action. This is what your setup looks like:

Your routes:

config/routes.rb

```ruby
Rails.application.routes.draw do
  get '/home', to:'website#home'
end
```

Your Application Layout:

app/views/layouts/application.html.erb

```erb
<!DOCTYPE html>
<html>
  <head>
    <title>My App</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <div id="basemate_ui">
      <%= yield %>
    </div>
  </body>
</html>
```
Note: Wrap your content with a div and assgin the id  "basemate_ui"

Your Controller Action:

app/controllers/website_controller.rb

```ruby
class WebsiteController < ApplicationController

  def home
    @foo = "foo"
    @bar = "bar"
    responder_for(Pages::Website::Home) #-> Basemate::Ui::Core::ApplicationHelper
  end

end
```

Your basemate Page:

app/basemate/pages/website/home.rb

```ruby
module Pages
  module Website
    class Home < Page::Cell::Page

      def response

        components {
          row do
            col do
              plain @foo
            end
            col id: "my_special_col" do
              plain @bar
            end
          end
        }

      end

    end
  end
end
```
This gives you following output:

```html
<div id='website_home'>
  <div class='row' id="row_1">
    <div class='col' id="row_1__col_1">
      foo
    </div>
    <div class='col' id="my_special_col">
      bar
    </div>
  </div>
</div>
```
As you can see, each component receives an id that is automatically created
using the components' name. Those ids should help you style specific parts of
your page later on, and can be overwritten in the page response if you need more freedom.

Note:

- "row", "col", "plain" are predefined core components
  - a documentation of predefined core component can be found here: TODO
- row/col class setup for bootstrap 4.x and material-design-lite can be found here:
  - bootstrap 4.x: TODO
  - material-design-lite: TODO
- you can customize the output of the core components
  - see: [Customize](#customize)
- you can add your own components
  - see: [Customize](#customize)
- you can use styles from Basemate Themes
  - see: [Themes](#themes)
- you can use components from Basemate Bundles
  - see: [Bundles](#bundles)

### Structure your basemate Page response with partials

If you don't want to define the response of you page in one block, you can use
partials.

Let's take our app/basemate/pages/website/home.rb and refactor it from this:

```ruby
module Pages
  module Website
    class Home < Page::Cell::Page

      def response

        components {
          row do
            col do
              plain @foo
            end
            col do
              plain @bar
            end
          end
          row do
            col do
              plain "hello"
            end
            col do
              plain "world"
            end
          end
        }

      end

    end
  end
end

```

to this:

```ruby
module Pages
  module Website
    class Home < Page::Cell::Page

      def response
        components {
          partial :row_1
          partial :row_2
        }
      end

      def row_1
        partial {
          row do
            col do
              plain @foo
            end
            col do
              plain @bar
            end
          end
        }
      end

      def row_2
        partial {
          row do
            col do
              plain "hello"
            end
            col do
              plain "world"
            end
          end
        }
      end


    end
  end
end

```

You could also implement dynamic partials, for example:

```ruby
module Pages
  module Website
    class Home < Page::Cell::Page

      def response
        components {
          partial :row, @foo, @bar
          partial :row, "hello", "world"
        }
      end

      def row first_col, second_col
        partial {
          row do
            col do
              plain first_col
            end
            col do
              plain second_col
            end
          end
        }
      end

    end
  end
end

```
### Use the Prepare method to implement page-related business logic

If you want to move code out of your controller action, you could place your
page-related business logic in the 'prepare'-method of your Basemate Page.


app/controllers/website_controller.rb

```ruby
class WebsiteController < ApplicationController

  def home
    #@foo = "foo" #moved to prepare method
    #@bar = "bar" #moved to prepare method
    responder_for(Website::Home)
  end

end

```

app/basemate/pages/website/home.rb

```ruby
module Pages
  module Website
    class Home < Page::Cell::Page

      def prepare
        @foo = "foo"
        @bar = "bar"
      end

      def response
        components {
          row do
            col do
              plain @foo
            end
            col do
              plain @bar
            end
          end
        }
      end

    end
  end
end

```

### Use Iterators

Often you need to iterate through some datastructure on your UI. Since you're
writing pure Ruby, it's straight forward. Iterations can use dynamic partials:

app/basemate/pages/website/home.rb

```ruby
module Pages
  module Website
    class Home < Page::Cell::Page

      def prepare
        @team_members = ["Mike", "Laura", "John"]
      end

      def response
        components {
          @team_members.each do |member|
            partial :member_profile, member
          end
        }
      end

      def member_profile member
        partial {
          row do
            col do
              plain member
            end
          end
        }
      end
    end
  end
end

```
