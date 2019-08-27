`app/matestack/components/bar.rb`

```ruby
class Components::Bar < Matestack::Ui::StaticComponent

  def response
    components {
      div class: "some" do
        div class: "crazy" do
          div class: "markup" do
            div class: "I don't want to write more than" do
              div class: "once" do
                plain @options[:content]
              end
            end
          end
        end
      end
    }
  end

end
```

Use your own components within apps, other components or pages like shown below:

`app/matestack/pages/my_app/my_first_page.rb`

```ruby
class Pages::MyApp::MyFirstPage < Matestack::Ui::Page

  def response
    components{
      #...
      custom_bar content: "hello world!"
    }
  end

end
```
