`app/matestack/components/foo.rb`

```ruby
class Components::Foo < Matestack::Ui::DynamicComponent

  def response
      components {
        div id: "my-component" do
          plain "I'm a fancy dynamic component! Call me {{dynamic_value}}!"
        end
      }
    end

end
```

`app/matestack/components/foo.js`

```ruby
MatestackUiCore.Vue.component('custom-foo', {
  mixins: [MatestackUiCore.componentMixin],
  data: function data() {
    return {
      dynamic_value: ""
    };
  },
  mounted(){
    const self = this;
    setTimeout(function () {
      self.dynamic_value = "bar"
    }, 1000);
  }
});

```

`app/matestack/pages/my_app/my_first_page.rb`

```ruby
class Pages::MyApp::MyFirstPage < Matestack::Ui::Page

  def response
    components{
      #...
      custom_foo
    }
  end

end
```
