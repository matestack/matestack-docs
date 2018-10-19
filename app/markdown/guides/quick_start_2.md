## 3. Add a "completed" button
We want to add a "completed" button to each task in our list. When clicked, the
database should be updated and the task should be displayed gray and crossed out.
For this example we want to add a "not completed" button if the task is done in
order to toggle the done state of each task.

Frist of all we need our backend action:

Your routes:

config/routes.rb

```ruby
Rails.application.routes.draw do
  get '/tasks', to:'tasks#list'

  put '/tasks/:id', to: 'tasks#update', as: 'update_task'
end
```

Your Controller Action:

app/controllers/tasks_controller.rb

```ruby
class TasksController < ApplicationController

  #...

  def update
    task = Task.find params[:id]
    task.update(task_params)

    unless task.errors.any?
      render status: 200, json: { message: "task updated" }
    else
      render status: 401, json: { message: "task update failed" }
    end
  end

  protected

  def task_params
    params.require(:task).permit(:name, :done)
  end

end
```

As you can see, we work with Rails "strong params" to have a secure API

Now we should add the "completed" button to our page:

app/basemate/pages/tasks/list.rb

```ruby
class Pages::Tasks::List < Page::Cell::Page

  def prepare
    @tasks = Task.last(5)
  end

  def response
    components {
      div do
        @tasks.each do |task|
          div class: "#{ 'done' if task.done }" do
            plain task.name
            # now we add the "action" core component
            action({
              method: :put,
              path: :update_task_path,
              params: { id: task.id },
              data: {
                task: {
                  #use the opposite of current state
                  done: !task.done
                }
              }
            }) do
              # display a button inside the "action" component
              if task.done
                button text: "not completed"
              else
                button text: "completed"
              end
            end
          end
        end
      end
    }
  end

end
```

We added the dynamic core component "action". This component takes a hash as an
argument. We specify which route (method, path, params) should be used and what
data should be sent to the backend action. In order to keep the response readable
we can use a method ("action_config" in this example) returning this hash:

app/basemate/pages/tasks/list.rb

```ruby
class Pages::Tasks::List < Page::Cell::Page

  def prepare
    @tasks = Task.last(5)
  end

  def response
    components {
      div do
        @tasks.each do |task|
          div class: "#{ 'done' if task.done }" do
            plain task.name
            # the method "action_config" returns the hash
            action action_config(task) do
              if task.done
                button text: "not completed"
              else
                button text: "completed"
              end
            end
          end
        end
      end
    }
  end

  # we use a method to keep our response clean
  def action_config task
    return {
      method: :put,
      path: :update_task_path,
      params: { id: task.id },
      # this data hash is sent to the backend action
      data: {
        task: {
          done: !task.done
        }
      }
    }
  end

end
```

When clicking on the button, the action would be performed, but nothing will change
on our view. We need a full page reload to see our changes. We need one final peace
to get dynamic rerendering: We tell the action to rerender a specific part of the UI
after the action has performed successfully. This part of the UI has to be marked
as "dynamic":

app/basemate/pages/tasks/list.rb

```ruby
class Pages::Tasks::List < Page::Cell::Page

  def prepare
    @tasks = Task.last(5)
  end

  def response
    components {
      # this div is now dynamic!
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          div class: "#{ 'done' if task.done }" do
            plain task.name
            action action_config(task) do
              if task.done
                button text: "not completed"
              else
                button text: "completed"
              end
            end
          end
        end
      end
    }
  end

  def action_config task
    return {
      method: :put,
      path: :update_task_path,
      params: { id: task.id },
      data: {
        task: {
          done: !task.done
        }
      },
      # rerender the dynamic div "tasks" after success
      success: {
        tasks: :rerender
      },
    }
  end

end
```

Ok and now we make our response more readable again, this time using a partial:

app/basemate/pages/tasks/list.rb

```ruby
class Pages::Tasks::List < Page::Cell::Page

  def prepare
    @tasks = Task.last(5)
  end

  def response
    components {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          # use a partial to make the response more readable
          partial :task_item, task
        end
      end
    }
  end

  def task_item task
    partial {
      div class: "#{ 'done' if task.done }" do
        plain task.name
        # partials can use partials themselves
        partial :toggle_done, task
      end
    }
  end

  def toggle_done task
    partial {
      action action_config(task) do
        if task.done
          button text: "not completed"
        else
          button text: "completed"
        end
      end
    }
  end

  def action_config task
    return {
      method: :put,
      path: :update_task_path,
      params: { id: task.id },
      data: {
        task: {
          done: !task.done
        }
      },
      success: {
        tasks: :rerender
      },
    }
  end

end
```

Let's see what we get now:
