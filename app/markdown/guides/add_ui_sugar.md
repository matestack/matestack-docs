On the previous guides we learned, how to implement dynamic pages and apps in pure
Ruby. basemate wants to cover the basic dynamic behaviour of your Web-App with
minimum complexity. You should be able to add custom UI Goodies on top of this
solid structure though. To give you maximum flexibility, you can use classic JavaScript
for that.

## 1. Handle Page Transition Events
We want to add a nice loading transition when the user navigates between pages.

basemate calls classic JavaScript functions on certain events. If you implement
these functions you can do all kinds of DOM-Manipulations. Let's see, how the
page transition effects on this documentation app are implemented.

(We're using Material Design Light, you could use whatever you want)

app/basemate/apps/guides.rb

```ruby
class Apps::Guides < App::Cell::App

  def response
    components {
      div do
        #...header and sidebar removed for this example
        partial :main_content
        # add two snackbars as documented on getmdl.io
        partial :notice_bar
        partial :alert_bar
      end
    }
  end

  def main_content
    partial {
      main class: "mdl-layout__content" do
        div do
          # we're using a custom component "row" here
          row no_spacing: true do
            # add the material design loading spinner as documented on getmdl.io
            div class: "loading" do
              div class: "mdl-spinner mdl-js-spinner is-active"
            end
            div id: "page_content" do
              page_content
            end
          end
        end
      end
    }
  end

  def notice_bar
    partial {
      partial :snackbar, "notice_bar", "mdl-snackbar--notice"
    }
  end

  def alert_bar
    partial {
      partial :snackbar, "alert_bar", "mdl-snackbar--alert"
    }
  end

  def snackbar id, custom_class
    partial {
      div id: id, class: "mdl-js-snackbar mdl-snackbar #{custom_class}" do
        div class: "mdl-snackbar__text"
        div class: "mdl-snackbar__action"
      end
    }
  end

end
```

Now let's add the custom JavaScript functions:

app/assets/javascripts/application.js

```javascript

var basemateUiCoreTransitionStart = function(url){
  document.querySelector('#page_content').style.opacity = 0;
  setTimeout(function () {
    document.querySelector('.mdl-spinner').style.display = "inline-block";
  }, 300);
}

var basemateUiCoreTransitionSuccess = function(url){
  setTimeout(function () {
    document.querySelector('.mdl-spinner').style.display = "none";
    document.querySelector('#page_content').style.opacity = 1;
    var noticebarContainer = document.querySelector('#notice_bar');
    var data = {message: 'loaded: ' + url, timeout: 1500};
    //call the material design light API:
    noticebarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

var basemateUiCoreTransitionError = function(url){
  setTimeout(function () {
    document.querySelector('.mdl-spinner').style.display = "none";
    document.querySelector('#page_content').style.opacity = 1;
    var alertbarContainer = document.querySelector('#alert_bar');
    var data = {message: 'error loading: ' + url, timeout: 3000};
    //call the material design light API:
    alertbarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

```

and a CSS3 transition:

app/assets/stylesheets/application.css

```css
#page_content{
  transition:opacity 0.2s linear;
}
```

## Handle Action Events

The same approach can be used to catch action events, fired by the action core
components:

app/assets/javascripts/application.js

```javascript

var basemateUiCoreActionSuccess = function(){
  setTimeout(function () {
    var noticebarContainer = document.querySelector('#notice_bar');
    var data = {message: 'done', timeout: 1500};
    //call the material design light API:
    noticebarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

var basemateUiCoreActionError = function(error){
  setTimeout(function () {
    var alertbarContainer = document.querySelector('#alert_bar');
    var data = {message: JSON.stringify(error.response.data.message), timeout: 3000};
    //call the material design light API
    alertbarContainer.MaterialSnackbar.showSnackbar(data)
  }, 500);
}

```

Let's see that in action:
