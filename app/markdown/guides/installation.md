<!-- **Do not use this setup if you want to build custom vue.js components.**
If you want to extend basemate by building your own vue.js components,
use Webpacker (see: [Setup with Webpacker](/docs/setup_webpacker)). -->

If your're using the classic Rails assets pipeline, this guide shows you how to
add basemate to your Rails app.

### Gemfile

Add 'basemate-ui-core' to your Gemfile

```ruby
gem 'basemate-ui-core', '~> 0.5.1'
```

and run

```shell
$ bundle install
```

### Javascript

Require 'basemate-ui-core' in your assets/javascript/application.js

```javascript
//= require basemate-ui-core
```

### Matestack Folder

Create a folder called 'basemate' in your app directory. All your basemate apps,
pages, components (and more to come) will be defined there.

### Include Helper

Add the basemate Helper to your controllers. If you want to make the helpers
available in all controllers, add it to your 'ApplicationController' this way:

app/controllers/application_controller.rb

```ruby
class ApplicationController < ActionController::Base
  include Matestack::Ui::Core::ApplicationHelper
end
```
