Static components are rendered to HTML on the serverside and transferred to the browser.
They can not perform any clientside interaction by definition. Simple "div"s and "span"s are examples of static core
components.

To create your own custom static component, you only have to follow these basic steps:

## 1. Requirements

You already have set up a basemate page with corresponding Rails route and controller.

## 2. Create folder structure

In your app/basemate folder, create a 'components' folder (if it not already exists). In this folder, create a folder that is named after your custom static component and enter this folder. For the sake of the basemate team's favorite food, we will call our component **hummus**!

```
cd app/basemate
mkdir components
cd components
mkdir hummus
cd hummus
```

## 3. Create your custom component - simple examples

Now, you got to choose whether you want to define your component in a Ruby class/response or in a HAML file.

### 3.1 Creating your custom component in Ruby

In the hummus folder, create the folder that will host your component and create your `.rb`-file.

```
mkdir cell
cd cell
touch hummus.rb
```

Define your custom component in the hummus.rb file following the naming conventions:

```ruby
class Components::Hummus::Cell::Hummus < Component::Cell::Static

  def response
    components {
      div class: "bar" do
        plain "And this is your hummus component, yay!"
      end
    }
  end

end
```

See **4. Usage** for results.

### 3.2 Creating your custom component in Haml

In the hummus folder, create the folder that will host your component and create your `.haml`-file.

```
mkdir view
cd view
touch hummus.haml
```

Define your custom component in the hummus.haml file:

```haml
.bar
  "And this is your hummus component, yay!"
```

See below for the results.

## 4. Usage

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
      hummus
    }
  end

end
```

and it creates

```html
<div class="foo">
  <span>This is Home!</span>
</div>
<div class="bar">
  And this is your hummus component, yay!
</div>
```

## 5. Namespacing and sub-components

Inside your components/hummus folder, you can create various sub-components by naming them differently than the folder name. They will be namespaced afterwards. For example, create a heading.rb in components/hummus/cell like that:

```ruby
class Components::Hummus::Cell::Heading < Component::Cell::Static

  def response
    components {
      heading size: 3, text: "Your hummus component heading!"
    }
  end

end
```

Now we put the custom component heading right above your custom component in your app/basemate/pages/website/home.rb

```ruby
class Pages::Website::Home < Page::Cell::Page

  def response
    components {
      div class: "foo" do
        span do
          plain "This is Home!"
        end
      end
      hummus_heading
      hummus
    }
  end

end
```

and it creates

```html
<div class="foo">
  <span>This is Home!</span>
</div>
<h3>Your hummus component heading!</h3>
<div class="bar">
  And this is your hummus component, yay!
</div>
```

## 6. Options

To further customize your components, you can use a prepare method within the component definition or use option values to further specify their appearance.

```ruby
class Components::Hummus::Cell::Heading < Component::Cell::Static

  def prepare
    @title = "Your generic hummus title"
  end

  def response
    components {
      heading size: options[:size], text: @title
      heading size: options[:sub_title_size], text: options[:sub_title]
    }
  end

end
```
Now, make sure to call your custom component with the options you specified.

```ruby
class Pages::Website::Home < Page::Cell::Page

  def response
    components {
      div class: "foo" do
        span do
          plain "This is Home!"
        end
      end
      hummus_heading size: 1, sub_title_size: 3, text: "Specific hummus subtitle"
      hummus
    }
  end

end
```

and it creates

```html
<div class="foo">
  <span>This is Home!</span>
</div>
<h1>Your generic hummus title</h1>
<h3>Specific hummus subtitle</h3>
<div class="bar">
  And this is your custom component, yay!
</div>
```

## 7. Summary

Following this guide, we have implemented a custom static basemate component in a few lines of Ruby. This custom component can now be used anywhere in your basemate application and keeps your code nice and **dry**.
