basemate makes Rails UI-Development easier, more robust and fun. Basemate can be
used in static request/response mode or dynamic SPA mode. Actually, basemate enables
you to create a dynamic SPA with minimum effort, but that's optional.

On this page we begin with static features and show you, how your static frontend
development gets easier. After covering these benefits, we start to show you, how
easy it is, to add dynamic features, getting the "app-feeling" we are all looking
for. Basemate is using pure vue.js for it's dynamic features, but you might never
see it, unless you wanna build your own dynamic components.

So be patient, we start pretty basic and add more and more juice with each step!

## 1. Stop writing HTML/HAML/ERB and enjoy pure Ruby

We don't enjoy writing pure HTML/HAML/ERB. We love Ruby! That's why we define
our views with pure Ruby. The following example shows the raw basemate usage:

```ruby
module Pages
  class Home < Page::Cell::Page

    def response
      components {
        div class: "row" do
          div class: "col" do
            plain "Hello"
          end
          div class: "col", id: "my_special_col" do
            plain "World!"
          end
        end
      }
    end

  end
end
```

which gives you that:

```html
<div id='home'>
  <div class='row'>
    <div class='col'>
      Hello
    </div>
    <div class='col' id="my_special_col">
      World!
    </div>
  </div>
</div>
```

You might say, that writing Ruby doesn't save lines of code in this example.
Well, you're right until this point (wait for it!). But still: For us it feels
more natural to write Ruby instead of HTML plus we are now able to use all of
Ruby's language features.

## 2. Keep your views DRY easily

Duplicating yourself while writing code is really annoying. We found ourselfs
writing similar lines of HAML/ERB/HTML all the time. Although there are
possibilities to avoid that within the classic Rails view layer, these approaches
felt too unhandy. Let's see, how basemate handles that:

```ruby
module Pages
  class Home < Page::Cell::Page

    def response
      components {
        div class: "row" do
          partial :crazy_column, "Hello"
          partial :crazy_column, "World!"
        end
      }
    end

    def crazy_column content
      partial {
        div class: "col" do
          plain content
        end
      }
    end

  end
end
```

As you can see, we use Ruby methods in order to define reusable partials. On
bigger views, this dramatically increases readability and maintainability!

## 3. Avoid using unhandy CSS classes all over your app

All major CSS-frameworks rely on multiple CSS classes in order to apply their
stylings and media-queries. Well, that's ok, but we don't want to pollute all our
views with something like this:

```html
<div class="mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title">
    <h2 class="mdl-card__title-text">Welcome</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </div>
  <div class="mdl-card__actions mdl-card--border">
    <a class="mdl-button mdl-button--colored mdl-js-button ">
      Get Started
    </a>
  </div>
  <div class="mdl-card__menu">
    <button class="mdl-button mdl-button--icon mdl-js-button ">
      <i class="material-icons">share</i>
    </button>
  </div>
</div>
```

in order to define a basic
[material-design card element](https://getmdl.io/components/index.html#cards-section).

Even in haml it's a mess:

```haml
.mdl-card.mdl-shadow--2dp
  .mdl-card__title
    %h2.mdl-card__title-text Welcome
  .mdl-card__supporting-text
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  .mdl-card__actions.mdl-card--border
    %a.mdl-button.mdl-button--colored.mdl-js-button
      Get Started
  .mdl-card__menu
    %button.mdl-button.mdl-button--icon.mdl-js-button
      %i.material-icons share
```

In order to avoid that mess, we can easily write reusable basemate components.
[Implemented correctly](/docs/component_usage), our views may look like this:

```ruby
module Pages
  class Home < Page::Cell::Page

    def response
      components {
        card title: "Welcome", primary_action: "Get Started", menu_items: ["share"] do
          plain "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        end
      }
    end

  end
end
```
"card" in this example is your custom component. Your component's view with all
these CSS classes is defined ONCE. You decide, which API your component should
have and how flexible it should be used across your app.

Our "card" component may look like this:

```ruby
module Components
  class Card < Component::Cell::Static

    def response
      components {
        div class: "mdl-card mdl-shadow--2dp" do
          partial :title
          partial :content
          partial :actions
          partial :menu
        end
      }
    end

    def title
      partial {
        div class: "mdl-card__title" do
          heading size: 2, text: options[:title]
        end
      }
    end

    def content
      partial {
        div class: "mdl-card__supporting-text" do
          component_content
        end
      }
    end

    def actions
      partial {
        div class: "mdl-card__actions mdl-card--border" do
          link class: "mdl-button mdl-button--colored mdl-js-button " do
            options[:primary_action]
          end
        end
      }
    end

    def menu
      partial {
        div class: "mdl-card__menu" do
          options[:menu_items].each do |item|
            button class: "mdl-button mdl-butt on--icon mdl-js-button " do
              icon class: "material-icons", icon_type: item
            end
          end
        end
      }
    end

  end
end
```
Remember: You define your component ONCE! Even if this needs more lines of code,
(especially if you use partials to increase readability like above) that's worth
it if you use your "card" component 42 times across your app. Maintainance happens
exactly at one file: "app/basemate/components/card/cell/card.rb". Your UI is gonna
be much more solid and way easier to maintain! (and it's more fun creating it)

## 4. Use existing components from the basemate community

If you're too lazy to create your own components, just use existing ones offered
by the community. The "card" components from the previous example is going to be
published alongside other material-design components by basemate. A growing
community may add a hole bunch of useful components. We're excited!

## 5. Handle user interaction dynamically without JavaScript

We all know it: A user doesn't enjoy a full page-reload after submitting a form
or clicking on a button triggering some kind of backend action. Users want to have
the "app-feeling" they are used to from all kinds of apps in 2018. In order to
fullfill this requirement, developers create fullblown Javascript Client-Applications
with React, Angular, Vue.js and so on .These Single Page Applications connect to
the backend using JSON-APIs. This approach seems to be valid, as everyone is
doing it. But keep in mind, that the complexity of developing and maintaining two
different systems may kill your project.

basemate wants to enable you to get this "app-feeling" with minimum effort.

The following example shows you, how a button click is handled asynchronously:

```ruby
module Pages
  class Users < Page::Cell::Page

    def prepare
      @users = DemoUser.all
    end

    def response
      components {
        div class: "mdl-grid" do
          div class: "mdl-cell" do
            heading size: 1, text: "Users"
          end
        end
        div dynamic: true, id: "users" do
          @users.each do |user|
            partial :user_row, user
          end
        end
      }
    end

    def user_row user
      partial {
        div class: "mdl-grid" do
          div class: "mdl-cell" do
            plain user.name
          end
          div class: "mdl-cell" do
            action action_config(user.id)
          end
        end
      }
    end

    def action_config(user_id)
      {
        text: "delete",
        type: :button,
        path: :delete_demo_user_path,
        params: { id: user_id },
        method: :delete,
        success: { users: :rerender }
      }
    end

  end
end
```

the corresponding controller actions:

```ruby
class ButtonDemoController < ApplicationController

  def show
    responder_for(Pages::Users)
  end

  def delete
    user = DemoUser.find params[:id]
    user.destroy
    render status: 200, json: {message: "success"}
  end

end
```

The page in this example displays all Demo Users. When clicking on a "delete" button
a DELETE request against /demo_user/:id (delete_demo_user_path with params) is
performed. If successful, the div with the id: users get rerendered by the server.
basemate's vue.js implementation partially upgrades only this div. The developer
doesn't need one line of Javascript for that!
