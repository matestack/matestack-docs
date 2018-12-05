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
<!-- somewhere in your body tag -->
<div id="basemate_ui">
  <%= yield %>
</div>
```
Note: Wrap your classic 'yield' with a div and assgin the id "basemate_ui"

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
          div class: "row" do
            div class: "col" do
              plain @foo
            end
            div class: "col", id: "my_special_col" do
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
          div class: "row" do
            div class: "col" do
              plain @foo
            end
            div class: "col" do
              plain @bar
            end
          end
          div class: "row" do
            div class: "col" do
              plain "hello"
            end
            div class: "col" do
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
          div class: "row" do
            div class: "col" do
              plain @foo
            end
            div class: "col" do
              plain @bar
            end
          end
        }
      end

      def row_2
        partial {
          div class: "row" do
            div class: "col" do
              plain "hello"
            end
            div class: "col" do
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
          div class: "row" do
            div class: "col" do
              plain first_col
            end
            div class: "col" do
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
          div class: "row" do
            div class: "col" do
              plain @foo
            end
            div class: "col" do
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
          div class: "row" do
            div class: "col" do
              plain member
            end
          end
        }
      end
    end
  end
end

```
