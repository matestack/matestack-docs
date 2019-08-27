Below you see the page class which has been referenced in the previous section. It renders a list by calling matestacks core components 'ul' and 'li' wrapped in a 'div'. In order to limit the nesting level of the main response method, a matestack partial - defined in a separate Ruby method - is used. Data is resolved in a 'prepare' method which is called before rendering.

`app/matestack/pages/my_app/my_first_page.rb`

```ruby
class Pages::MyApp::MyFirstPage < Matestack::Ui::Page

  def prepare
    @technologies = ["Rails", "Vue.js", "Trailblazer", "Rspec", "Capybara"]
  end

  def response
    components{
      div id: "my-first-page" do
        ul class: "list" do
          @technologies.each do |technology|
            partial :my_list_item, technology
          end
        end
      end
    }
  end

  def my_list_item technology
    partial {
      li class: "list-item" do
       plain technology
     end
    }
  end

end
```

Like the classic view layer, a page (view) gets normally yielded in an app (layout): 

`app/matestack/apps/my_app.rb`

```ruby
class Apps::MyApp < Matestack::Ui::App

  def response
    components{
      header do
        heading size: 1, text: "My App"
      end
      main do
        page_content # page get yielded here!
      end
      footer do
        plain "That's it!"
      end
    }
  end

end
```
