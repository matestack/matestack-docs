# Basemate: Escape the frontend hustle
#### Create maintainable, dynamic and beautiful UIs easily

basemate melts Rails and Vue.js down to one holistic Web Dev Framework.
By progressively replacing the classic View-Layer, basemate deeply integrates a
Vue.js based UI into Rails, offering optional prebuilt components. Use it to
write dynamic Web-UIs with minimum effort and maximum dev happiness.

## What exactly is basemate?
**basemate = Rails + Vue.js**

basemate is a Rails Engine, turning the MVC-Framework Ruby on Rails into a
state-of-the-art Fullstack Web-Development Framework.
With basemate you are able to write dynamic Web-Apps in pure Ruby. HTML, CSS
and JavaScript are only used for adding special, custom UI behaviour that exceeds
basemate's core functionality. The main goals are:

- Reduction of complexity of modern web development, moving front and backend closer together
- More maintainable UI code, using a component-based structure written in Ruby
- Increased development speed and happiness, offering prebuilt UI-Components for classic requirements
- Modern, dynamic UI feeling without the need to implement a separate JavaScript Application

basemate progressively replaces the classic Rails-View-Layer. You are able to use
it alongside your classic views and incrementally turn your Rails-App into a
dynamic, more maintainable Web-App.

## Why basemate?

Back in the days, we fell in love with Rails because it was simple to create
applications using just Ruby and not much else. Nowadays, Web Apps often have to
be dynamic. Users don’t enjoy static request-response websites with constant
full page reloads. They are used to native Apps and the so called “App-feeling”.
Right now, Rails doesn’t serve you well here.

To get this feeling, we started to create fullblown Javascript applications and
reduced Rails to a pure JSON API. Now we got that dynamic “App-feeling”
on our UIs, but increased the complexity in our development by introducing a separate
full-blown frontend framework. Implementing two separate systems (backend-api,
frontent-app) is a pain: Two different code bases, two repositories to maintain,
two different deployment schedules, two test environments, two everything...!

This sophisticated architecture for sure offers a lot of flexibility and
possibilites how to extend your systems. But you know what? We didn’t need that
flexibility! In 90% of our projects, we just had to create a straight forward
app for a small to medium-size company but ended up setting up an architecture
which would be suitable for big enterprises with lots of engineers and big budgets.

To escape this, we made a step back and rethought the way Web Apps are implemented
today, thinking about the biggest pain points we were facing when creating modern Web UIs
and called it the “frontend hustle”. We realized that we still love most concepts
of Rails. But we were missing a good approach to easily define a maintainable,
dynamic UI deeply integrated into Rails. That's why basemate was born!

Originally invented to reduce our own pain in development and using it in our
daily business, we started to really love basemate and thought of sharing it
with the world! Now we’re on the search for other developers to improve and use the
architecture in a community of mates! So if you’re with us:

Escape the frontend hustle. Create maintainable, dynamic and beautiful UIs easily. Use basemate.

## How does it work?

Imagine: You want to add a comment section to your UI, displaying the latest 5 comments.
Users should be able to create and to delete comments. All actions should be
performed asynchronously without a full page-reload.

Let's have a look on how this would be implemented in basemate:

```ruby
class Pages::Comments::List < Page::Cell::Page

  # perform any tasks before rendering
  def prepare
    @comments = Comment.last(5)
  end

  # our UI is defined in pure ruby
  # "div", "span", "plain"... are core components
  # core components cover all classic html tags
  # you can use your own custom components
  # the "div" in our response is dynamic: it can be rerendered
  # keep the response clean by using partials
  def response
    components {
      div id: "tasks", dynamic: true do
        @comments.each do |comment|
          partial :comment_item, comment
        end
      end
      partial :new_comment_form
    }
  end

  # partials are define in ruby methods
  # "action" is a core component performing async actions
  # "delete_action_config" is a method returning the config in order to keep
  # the response clean
  def comment_item comment
    partial {
      div do
        plain comment.content
        action delete_action_config(comment) do
          plain "delete"
        end
      end
    }
  end

  # define a form with the "form" core component
  # "new_comment_form_config" is a method returning the config in order to keep
  # the response clean
  def new_comment_form
    partial {
      form new_comment_form_config do
        input type: :text, key: :content
        submit do
          button text: "create"
        end
      end
    }
  end

  # the input values will be wrapped in an object
  # with key "comment". That's what our backend action is expecting
  # rerender component with id=tasks after success
  def new_comment_form_config
    form_config = {
      for: :comment,
      path: :create_comment_path,
      method: :post,
      success: {
        tasks: :rerender
      }
    }
  end

  # rerender component with id=tasks after success
  def delete_action_config comment
    action_config = {
      path: :delete_comment_path,
      params: { id: comment.id },
      method: :delete,  
      success: {
        tasks: :rerender
      }
    }
  end


end
```
So what have we got here? A dynamic UI without having to write one single line
of JavaScript! Simply by using the full power of Rails (Routing, Controller
Actions, Strong Params) and simply adding a dynamic UI on top of it. Dynamic
core components added Vue.js component instances to our UI.
These components use a Vue.js event hub to communicate with each other, e.g.
to perform dynamic rerendering after user interactions.

### Rails Integration

**basemate is designed to progressively replace the classic Rails-View-Layer. All
other concepts of Rails stay untouched.**
A HTTP request is processed similarly as in the classic Rails MVC architecture.
Inside a controller action, you can add a basemate helper, referencing a basemate page
class. This basemate page consists of multiple components and is written in pure Ruby,
as seen on the example above. Using Trailblazer's "cell" concept, the basemate page
renders HTML which is then transferred to the browser.

```ruby
class CommentsController < ApplicationController

  include Basemate::Ui::Core::ApplicationHelper

  def list
    # use a basemate page as response
    responder_for(Pages::Comments::List)
  end

end
```

You can decide on each action, if you want to use a classic Rails view or a basemate page!

### Vue.js Integration

basemate uses Vue.js for its dynamic features. All dynamic components rely on a
Vue.js component in order to perform clientside logic.

basemate renders HTML on the serverside and wraps dynamic components with a special
component tag. Vue.js compiles this HTML and mounts Vue.js components on top of it.
**These Vue.js components do whatever a Vue.js component can do. Basemate doesn't
limit Vue.js functionality.** This is especially important for developers, who want
to create their own dynamic components.

In order to add basic dynamics to your UI, basemate's core components are designed
to request a new serverside rendered part of the view during runtime and only replace a specifc
part of the DOM with the server's response. If you want to implement a more advanced
UI-Component, you can call the server's JSON API and perform Vue.js clientside rendering you're
already familiar with. On each component you can decide, what kind of rendering you
need in order to create the UI-Behaviour you're looking for. Hint: More often than expected,
the basic dynamic serverside rererendering serves you very well!
