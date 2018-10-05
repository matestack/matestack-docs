# Basemate::UI::Core Dummy App

This app demonstrates the simplest approach to use Basemate::Ui::Core without any bundle or theme installed. Assets are compiled and served only with sprockets. Webpacker is not installed. This makes it very easy to integrate without any further dependencies. This approach is not recommend if you want to extend Basemate through building your own components - you should use Webpacker instead.

## Description

TODO

## Development setup

In order to use a local basemate-ui-core repo (during development), clone the basemate-ui-core repo somewhere locally and create a symlink in "vendor/basemate-ui-core", then do this:

````
RAILS_ENV=development bundle install
````

## Deployment

(only for contributers)

````
git push heroku master
````

## Live Demo

The demo application runs [here](http://basemate-ui-core.herokuapp.com/).
