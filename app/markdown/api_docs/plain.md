# basemate core component: Partial

This element simply renders the value of a variable wherever you want it.

## Parameters

This component expects one parameter.

## Example

Render a variable into a div tag.

```ruby

@foo = "Hello World"

def response
  components {
    div id: "foo", class: "bar" do
      plain @foo
    end
  }
end

```

returns

```html
<div id="foo" class="bar">
  Hello World
</div>
```
