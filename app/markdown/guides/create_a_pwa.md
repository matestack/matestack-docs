Use this third party gem: [github.com/rossta/serviceworker-rails](https://github.com/rossta/serviceworker-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'serviceworker-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install serviceworker-rails

To set up your Rails project for use with a Service Worker, you either use the
Rails generator and edit the generated files as needed, or you can follow the
manual installation steps.

### Automated setup

After bundling the gem in your Rails project, run the generator from the root of
your Rails project.

```
$ rails g serviceworker:install
```

The generator will create the following files:

* `config/initializers/serviceworker.rb` - for configuring your Rails app
* `app/assets/javascripts/serviceworker.js.erb` - a blank Service Worker
  script with some example strategies
* `app/assets/javascripts/serviceworker-companion.js` - a snippet of JavaScript
  necessary to register your Service Worker in the browser
* `app/assets/javascripts/manifest.json.erb` - a starter web app manifest
  pointing to some default app icons provided by the gem
* `public/offline.html` - a starter offline page

It will also make the following modifications to existing files:

* Adds a sprockets directive to `application.js` to require
  `serviceworker-companion.js`
* Adds `serviceworker.js` and `manifest.json` to the list of compiled assets in
  `config/initializers/assets.rb`
* Injects tags into the `head` of `app/views/layouts/application.html.erb` for
  linking to the web app manifest

**NOTE** Given that Service Worker operates in a separate browser thread, outside the context of your web pages, you don't want to include `serviceworker.js` script in your `application.js`. So if you have a line like `require_tree .` in your `application.js` file, you'll either need to move your `serviceworker.js` to another location or replace `require_tree` with something more explicit.

To learn more about each of the changes or to perform the set up yourself, check
out the manual setup section below
