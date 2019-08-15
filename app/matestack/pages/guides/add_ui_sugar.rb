class Pages::Guides::AddUiSugar < Matestack::Ui::Page

  def prepare
    @title = "Add UI Sugar"
    @sub_title = "Add some custome JavaScript and CSS to improve look and feel"

    @tasks = DemoTask.last(5)
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_md path: "markdown/guides/add_ui_sugar"
           custom_rowclass: "demo-area" do
              custom_col do
                partial :demo_1
              end
            end
          end
        end
      end
    }
  end

  def demo_1
    partial {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          partial :task_item, task
        end
      end
      partial :new_task_form
    }
  end

  def task_item task
    partial {
      div class: "#{ 'done' if task.done }" do
        plain task.name
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
        "tasks": :rerender
      }
    }
  end

  def new_task_form
    partial {
      form new_task_form_config do
        input type: :text, key: :name
        submit do
          button text: "create"
        end
      end
    }
  end

  def new_task_form_config
    return {
      for: :task,
      path: :create_task_path,
      method: :post,
      success: {
        "tasks": :rerender
      }
    }
  end

end
