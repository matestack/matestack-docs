## 5. Add an inline edit form for each Task
We want to be able to edit a Task inline. Therefore we want to click on a Task's
name and expect a input to appear. After modifying the value and defocussing the
the input, we want the value to be saved to the database. basemate has a core
component for that:

Your basemate page:

```ruby
class Pages::Tasks::List < Page::Cell::Page

  def prepare
    @tasks = Task.all.order(:id)
  end

  def response
    components {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          partial :editable_task_item, task
        end
      end
      partial :new_task_form
    }
  end

  #...

  def editable_task_item task
    partial {
      # apply the class "done" if task is set to done
      div class: "#{ 'done' if task.done }" do
        form edit_task_form_config(task) do
          # now we use the "input_inline" core component
          # to get an inline edit form
          input_inline value: task.name, type: :text, key: :name
        end
        partial :toggle_done, task
      end
    }
  end

  def edit_task_form_config task
    return {
      for: :task,
      path: :update_task_path,
      params: { id: task.id },
      method: :put,
      success: {
        "tasks": :rerender
      }
    }
  end
```

Let's see what we get now: (Click on a Task to edit it)
