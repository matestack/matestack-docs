
```ruby
class Pages::Comments::List < Page::Cell::Page

  # perform any tasks before rendering
  def prepare
    @comments = Comment.last(5)
  end

  # our UI is defined in pure ruby
  # "div", "span", "plain"... are core components
  # you can use your own custom components
  # the "div" in our response is dynamic: it can be rerendered
  # it will be rerendered on a broadcasted event "comments_changed"
  # the server will broadcast this event via websockets
  # keep the response clean by using partials
  def response
    components {
      div id: "tasks", dynamic: true, rerender_on: "comments_changed" do
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

  # the input values will be wrapped in an object with the key "comment".
  # that's what our backend action is expecting (Rails Strong Params)
  # the form will perform a POST request against the create_comment_path
  # create_comment_path is defined in your Rails routes
  # --> e.g. POST api/comments, payload: { comment: { content: "hello world" } }
  def new_comment_form_config
    form_config = {
      for: :comment,
      path: :create_comment_path,
      method: :post
    }
  end

  # this action will perform a DELETE request against the delete_comment_path
  # delete_comment_path is defined in your Rails routes
  # it will use the comment's id as a request parameter
  # --> e.g. DELETE api/comments/1
  def delete_action_config comment
    action_config = {
      path: :delete_comment_path,
      params: { id: comment.id },
      method: :delete
    }
  end


end
```

and the corresponding Rails controller:

```ruby

class ApiController < ApplicationController

  def create_comment
    comment = DemoComment.create(comment_params)

    unless comment.errors.any?
      broadcast
      render status: 201, json: { message: "comment created" }
    else
      render status: 422, json: { message: "comment creation failed" }
    end
  end

  def delete_comment
    comment = DemoComment.find params[:id]
    comment.destroy
    broadcast
    render status: 200, json: { message: "comment deleted" }
  end

  protected

  def broadcast
    ActionCable.server.broadcast("basemate_ui_core", {
      message: "comments_changed"
    })
  end

  def comment_params
    params.require(:comment).permit(:content)
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
