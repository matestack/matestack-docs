Let's see how basemate makes frontend development easier. Be patient, we start
pretty basic and add more and more juice with each step!

## 1. Stop writing HTML/HAML/ERB and enjoy pure Ruby

We don't enjoy writing pure HTML/HAML/ERB. We love Ruby! That's why we define
our views with pure Ruby. The following example shows the raw basemate usage:

```ruby
class Home < Page::Cell::Page

  def response
    components {
      div class: "row" do
        div class: "col" do
          plain "Hello"
        end
        div class: "col", id: "my_special_col" do
          plain "World!"
        end
      end
    }
  end

end
```

which gives you that:

```html
<div id='home'>
  <div class='row'>
    <div class='col'>
      Hello
    </div>
    <div class='col' id="my_special_col">
      World!
    </div>
  </div>
</div>
```

You might say, that writing Ruby doesn't save lines of code in this example.
Well, you're right until this point (wait for it!). But still: For us it feels
more natural to write Ruby instead of HTML plus we are now able to use all of
Ruby's language features.

## 2. Keep your views DRY easily

Duplicating yourself while writing code is really annoying. We found ourselfs
writing similar lines of HAML/ERB/HTML all the time. Although there are
possibilities to avoid that within the classic Rails view layer, these approaches
felt too unhandy. Let's see, how basemate handles that:

```ruby
class Home < Page::Cell::Page

  def response
    components {
      div class: "row" do
        partial :crazy_column, "Hello"
        partial :crazy_column, "World!"
      end
    }
  end

  def crazy_column content
    partial {
      div class: "col" do
        plain content
      end
    }
  end

end
```

As you can see, we use Ruby methods in order to define reusable partials. On
bigger views, this dramatically increases readability and maintainability!

## 3. Avoid using unhandy CSS classes all over your app

All major CSS-frameworks rely on multiple CSS classes in order to apply their
stylings and media-queries. Well, that's ok, but we don't want to pollute all our
views with something like this:

```html
<div class="mdl-card mdl-shadow--2dp">
  <div class="mdl-card__title">
    <h2 class="mdl-card__title-text">Welcome</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  </div>
  <div class="mdl-card__actions mdl-card--border">
    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
      Get Started
    </a>
  </div>
  <div class="mdl-card__menu">
    <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
      <i class="material-icons">share</i>
    </button>
  </div>
</div>
```

in order to define a basic
[material-design card element](https://getmdl.io/components/index.html#cards-section).

Even in haml it's a mess:

```haml
.mdl-card.mdl-shadow--2dp
  .mdl-card__title
    %h2.mdl-card__title-text Welcome
  .mdl-card__supporting-text
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  .mdl-card__actions.mdl-card--border
    %a.mdl-button.mdl-button--colored.mdl-js-button.mdl-js-ripple-effect
      Get Started
  .mdl-card__menu
    %button.mdl-button.mdl-button--icon.mdl-js-button.mdl-js-ripple-effect
      %i.material-icons share
```

In order to avoid that mess, we can easily write reusable basemate components.
[Implemented correctly](/docs/component_usage), our views may look like this:

```ruby
class Home < Page::Cell::Page

  def response
    components {
      card title: "Welcome", action: "share" do
        plain "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
      end
    }
  end

end
```

A components view with all these CSS classes is defined ONCE. You decide, which
API your component should have and how flexible it should be used across your app.
Can you imagine, how helpful this is while creating complex UIs?

## There's so much more. Work in progress!
