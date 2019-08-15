class Pages::Guides::CreateADynamicUi < Matestack::Ui::Page

  def prepare
    @title = "Sorry"
    @sub_title = "Docs under construction"

    @tasks = DemoTask.last(5)
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            #custom_row do
            #   custom_col do
            #    custom_md path: "markdown/guides/quick_start_1"
            #   end
            # end
            #custom_rowclass: "demo-area" do
            #   custom_col do
            #     partial :demo_1
            #   end
            # end
            #custom_row do
            #   custom_col do
            #    custom_md path: "markdown/guides/quick_start_2"
            #   end
            # end
            #custom_rowclass: "demo-area" do
            #   custom_col do
            #     partial :demo_2
            #   end
            # end
            #custom_row do
            #   custom_col do
            #    custom_md path: "markdown/guides/quick_start_3"
            #   end
            # end
            #custom_rowclass: "demo-area" do
            #   custom_col do
            #     partial :demo_3
            #   end
            # end
            #custom_row do
            #   custom_col do
            #    custom_md path: "markdown/guides/quick_start_4"
            #   end
            # end
            #custom_rowclass: "demo-area" do
            #   custom_col do
            #     partial :demo_4
            #   end
            # end
            #custom_row do
            #   custom_col do
            #    custom_md path: "markdown/guides/quick_start_5"
            #   end
            # end
          end
        end
      end
    }
  end

  def demo_1
    partial {
      div id: "tasks" do
        @tasks.each do |task|
          div do
            plain task.name
          end
        end
      end
    }
  end

  def demo_2
    partial {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          partial :task_item, task
        end
      end
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
      action action_config_2(task) do
        if task.done
          button text: "not completed"
        else
          button text: "completed"
        end
      end
    }
  end

  def action_config_2 task
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
      },
      notify: false
    }
  end

  def demo_3
    partial {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          partial :task_item, task
        end
      end
      partial :new_task_form
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
      },
      notify: false
    }
  end

  def demo_4
    partial {
      div id: "tasks", dynamic: true do
        @tasks.each do |task|
          partial :editable_task_item, task
        end
      end
      partial :new_task_form
    }
  end

  def editable_task_item task
    partial {
      div class: "#{ 'done' if task.done }" do
        form edit_task_form_config(task) do
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
      },
      notify: false
    }
  end

end
