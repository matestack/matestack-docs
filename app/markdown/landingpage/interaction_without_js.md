Below, you see a page rendering a form and a list of the latest 5 instances of an Active Record model 'MyModel'. When the form is successfully submitted, the list gets rerendered without a full page reload. The Vue.js part of matestack's `async` component only requests a fresh version of the list from the server and rerenders this specific part. Same applies for the delete action which is performed with matestack's `action` component. If the form contains invalid data, matestack's `form_input` component  automatically renders Active Record validation error messages. Additionally, an error messages is shown for 5 seconds.

All of this dynamic behaviour is implemented without writing a single line of Javascript.

`app/matestack/pages/my_app/my_first_page.rb`

```ruby
class Pages::MyApp::MyFirstPage < Matestack::Ui::Page

  def prepare
    @my_model = MyModel.new
  end

  def response
    components {
      form my_form_config, :include do
        form_input key: :some_model_attribute, type: :text
        form_submit do
          button text: "Submit me!"
        end
      end
      async show_on: "form_has_errors", hide_after: 5000 do
        plain "Data could not be submitted, please check form"
      end
      partial :latest_5_list
    }
  end

  def latest_5_list
    partial {
      async rerender_on: "rerender_list" do
        ul do
          MyModel.last(5).each do |my_model_instance|
            li do
              span class: "item", text: my_model_instance.some_model_attribute
              action my_delete_config(my_model_instance.id) do
                button text: "delete"
              end
            end
          end
        end
      end
    }
  end

  # component configurations as methods returning a hash

  def my_form_config
    {
      for: @my_model,
      method: :post,
      path: :some_rails_action_path,
      success: {
        emit: "rerender_list"
      },
      failure: {
        emit: "form_has_errors"
      }
    }
  end

  def my_delete_config instance_id
    {
      method: :delete,
      path: :some_rails_action_path,
      params: {
        id: instance_id
      },
      success: {
        emit: "rerender_list"
      }
    }
  end

end
```
