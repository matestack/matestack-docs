## 4. Add an input for new Tasks
Now let's add an input in order to create new Tasks. This input should be handled
asynchronously without a page reload like the UI we seen above. We also want to
add some clientside validations that prevent invalid input from being sent to the server.

First of all we need a new route and controller action:

Your routes:

config/routes.rb

```ruby
Rails.application.routes.draw do
  get '/tasks', to:'tasks#list'

  put '/tasks/:id', to: 'tasks#update', as: 'update_task'
  post '/tasks', to: 'tasks#create', as: 'create_task'
end
```

Your Controller Action:

app/controllers/tasks_controller.rb

```ruby
class TasksController < ApplicationController

  #...

  def create
    task = Task.create(task_params)

    unless task.errors.any?
      render status: 200, json: { message: "task created" }
    else
      render status: 401, json: { message: "task creation failed" }
    end
  end

  protected

  def task_params
    params.require(:task).permit(:name, :done)
  end

end
```

Your basemate page:


```ruby
class Pages::Tasks::List < Page::Cell::Page

  def prepare
    @tasks = Task.last(5)
  end

  def response
    components {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          partial :task_item, task
        end
      end
      partial :new_task_form
    }
  end

  #...

  def new_task_form
    partial {
      # define a form with the "form" core component
      # new_task_form_config is a method returning the config
      form new_task_form_config do
        input type: :text, key: :name
        submit do
          # you can put all kinds of components here
          button text: "create"
        end
      end
    }
  end

  def new_task_form_config
    return {
      # the input values will be wrapped in an object
      # with key "task". That's what our backend action
      # is expecting
      for: :task,
      path: :create_task_path,
      method: :post,
      # agian, rerender after success
      success: {
        tasks: :rerender
      }
    }
  end

end
```

Let's see what we get now:
