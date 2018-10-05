This setup part documents the simplest approach to use Basemate::Ui::Core
without any basemate bundle or theme involved. Assets are compiled and served
only via sprockets. This makes it very easy to integrate it in a classic Rails
project without any further dependencies.
**Do not use this setup if you want to build custom vue.js components.**
If you want to extend basemate by building your own vue.js components,
use Webpacker (see: [Setup with Webpacker](/docs/setup_webpacker)).

### Gemfile

Add 'basemate-ui-core' to your Gemfile

```ruby
gem 'basemate-ui-core', :git => 'https://github.com/basemate/basemate-ui-core.git'
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

### Basemate Folder

Create a folder called 'basemate' in your app directory. All your basemate apps,
pages, components (and more to come) will be defined there.

### Include Helper

Add the basemate Helper to your controllers. If you want to make the helpers
available in all controllers, add it to your 'ApplicationController' this way:

app/controllers/application_controller.rb

```ruby
class ApplicationController < ActionController::Base
  include Basemate::Ui::Core::ApplicationHelper
end
```
