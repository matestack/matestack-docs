# Basemate::UI::Core Dummy App

This app demonstrates the simplest approach to use Basemate::Ui::Core without any bundle or theme in charge. Assets are compiled and served only with sprockets. Webpacker is not installed. This makes it very easy to integrate without any further dependencies. It is not recommend if you want to extend Basemate through building your own components; you should use Webpacker instead.

## Description

TODO

## Development setup

In order to use a local basemate-ui-core repo (during development), clone the basemate-ui-core repo somewhere locally and create a symlink in "vendor/basemate-ui-core", then do this:

````
RAILS_ENV=development bundle install
````

## Delpoyment

(only for contributers)

````
git push heroku master
````
