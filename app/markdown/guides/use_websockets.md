Websockets can easily be integrated into basemate. Basemate uses Rails ActionCable
for this feature!

Docs in progress here!

## Create a channel on the serverside

app/channels/basemate\_ui\_core_channel.rb

```ruby
class BasemateUiCoreChannel < ApplicationCable::Channel

  def subscribed
    stream_from "basemate_ui_core"
  end

end

```

## Add a subscription on the clientside and add a link to basemate

app/assets/javascripts/application.js

```javascript

//= require cable
//= require basemate-ui-core

App.cable.subscriptions.create("BasemateUiCoreChannel", {
  received(data) {
    BasemateUiCore.basemateEventHub.$emit('BasemateUiCoreChannel', data)
  }
});

```

## Use it on a component in your response

app/basemate/pages/yourpage.rb

```ruby

#...

# rerender_on: "comments_changed" makes this div listen to
# a event called "comments_changed"
# if fired by the server (see controller action below), the div gets rerendered
div id: "tasks", dynamic: true, rerender_on: "comments_changed" do
  ul class: "mdl-list" do
    @comments.each do |comment|
      plain comment.content
    end
  end
end

#...

```


app/controllers/yourcontroller.rb


```ruby
#...

def create_comment
  comment = DemoComment.create(comment_params)

  unless comment.errors.any?
    broadcast
    render status: 201, json: { message: "comment created" }
  else
    render status: 422, json: { message: "comment creation failed" }
  end
end

protected

def broadcast
  ActionCable.server.broadcast("basemate_ui_core", {
    message: "comments_changed"
  })
end

#...
```
