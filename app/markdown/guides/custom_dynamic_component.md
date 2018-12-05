Dynamic components are rendered to HTML on the serverside and transferred
to the browser. In contrast to static components, they are wrapped in a special
HTML tag and shipped with a Vue.js component JS. Thanks to Vue.js, they can perform
all kinds of clientside actions, such as API calls on a specific user interaction.

To create your own custom dynamic component, you only have to follow these basic steps:

## 1. Requirements

You already have set up a basemate page with corresponding Rails route and controller.

## 2. Create folder structure

In your app/basemate folder, create a 'components' folder (if it not already exists).
In this folder, create a folder that is named after your custom dynamic component and enter this folder.

```
cd app/basemate
mkdir components
cd components
mkdir custom
cd custom
```

## 3. Create your custom component

In your custom folder, create the folder that will host your component and create your `.rb`-file.

```
mkdir cell
cd cell
touch custom.rb
```

Define your custom component in the custom.rb file following the naming conventions:

(we are using vue.js render syntax below)

```ruby
class Components::Custom::Cell::Custom < Component::Cell::Dynamic

  def response
    components {
      div do
        button class: "button", id: "foo", attributes: { "@click": "callApi" } do
          plain "call API"
        end
        span class: "bar", attributes: { "v-for": "user in users" } do
          plain "{{user.name}}"
        end
      end
    }
  end

end
```

Note:

  - your component response has to be wrapped in exactly one root element!
    - in this case we used ONE div, wrapping everything else
    - this is required by Vue.js
  - we are using Vue.js render syntax
    - e.g.: '{{user.name}}'
  - Vue.js tag attributes have to be wrapped inside the attributes key
    - e.g.: attributes: { "@click": "callApi" }

## 4. Vue.js Component

As you are defining your own DYNAMIC component, you need to add some Vue.js JavaScript:

Inside your app/basemate/components/custom folder do:

```
mkdir js
cd js
touch custom.js
```

and add:

```javascript

// the Vue.js component has to be called like your ruby component + "-cell"
// in this case: "custom-cell"
BasemateUiCore.Vue.component('custom-cell', {
  mixins: [BasemateUiCore.componentMixin],
  data: function data() {
    return {
      users: []
    };
  },
  methods: {
    callApi: function() {
      var self = this;
      BasemateUiCore.axios.get("/api/users.json")
      .then(function(response){
        self.users = response.data;
      });
    }
  }
});


```

You need to add this JS to your application.js:

app/assets/javascripts/application.js

```js

//...

//= require basemate-ui-core
//= require custom/js/custom

//...

```

and register the route once:

config/initializers/assets.rb

```ruby
Rails.application.config.assets.paths << Rails.root.join('app/basemate/components')
```

## 5. Usage

In your app/basemate/pages/website/home.rb, we insert the custom component

```ruby
class Pages::Website::Home < Page::Cell::Page

  def response
    components {
      div class: "foo" do
        span do
          plain "This is Home!"
        end
      end
      custom
    }
  end

end
```
