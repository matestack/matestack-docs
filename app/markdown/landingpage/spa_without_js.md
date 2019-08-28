`app/matestack/apps/my_app.rb`

```ruby
class Apps::MyApp < Matestack::Ui::App

  def response
    components{
      header do
        heading size: 1, text: "My App"
      end
      nav do
        transition path: :my_first_page_path do
          button text: "Page 1"
        end
        transition path: :my_second_page_path do
          button text: "Page 2"
        end
      end
      main do
        page_content # pages are dynamically yielded here when buttons are clicked!
      end
      footer do
        plain "That's it!"
      end
    }
  end

end
```

`app/matestack/pages/my_app/my_first_page.rb`

```ruby
class Pages::MyApp::MyFirstPage < Matestack::Ui::Page

  def response
    components{
      div id: "div-on-page-1" do
        plain "My First Page"
      end
    }
  end

end
```
`app/matestack/pages/my_app/my_second_page.rb`

```ruby
class Pages::MyApp::MySecondPage < Matestack::Ui::Page

  def response
    components{
      div id: "div-on-page-2" do
        plain "My Second Page"
      end
    }
  end

end
```
