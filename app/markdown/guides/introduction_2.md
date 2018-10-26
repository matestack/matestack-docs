
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

We've created a dynamic UI without writing one line of JavaScript. We're
using the full power of Rails and simply added a dynamic UI on top of it without
breaking any concepts of Rails (Routing, Controller Actions, Strong Params).
Dynamic core components added Vue.js component instances to our UI without us
beeing aware of it. These components used an Vue.js event hub to communicate to
each other, performing dynamic rerendering after user interactions.
