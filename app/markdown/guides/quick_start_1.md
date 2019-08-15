To get you into the concepts of basemate as quick as possible, we will create -
as on many other tutorials - a simple
Todo-List-App, as this covers all we need to learn right now.

The demos on this page are not styled by purpose. You can apply your preferred
custom CSS or apply basemate themes (coming soon).

Prerequisites: You have installed [Rails](https://guides.rubyonrails.org/getting_started.html)
and [basemate](/guides/installation)

## 1. Create a Task Model
First of all, we need to migrate the database and create our Task model

Your migration:

We run:

```shell
rails g migration CreateTasks
```

db/migrate/xxx\_create_tasks.rb

```ruby
class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done, default: false
    end
  end
end

```

Your model:

app/models/task.rb

```ruby
class Task < ApplicationRecord

  validates :name, presence: true

end
```

Now we run:

```shell
rake db:migrate
```

Ok, now we should have a empty Task table in our database. Let's add some seeds
to fill the database Tasks:

db/seeds.rb

```ruby
Task.create([
  { name: 'Learn basemate' },
  { name: 'Use basemate' },
  { name: 'Extend basemate' }
])
```

and run

```shell
rake db:seed
```

## 2. Display all Tasks in a list

In order to display something in the browser, we need to setup some classic basics:

Your routes:

config/routes.rb

```ruby
Rails.application.routes.draw do
  get '/tasks', to:'tasks#list'
end
```

Your Application Layout:

app/views/layouts/application.html.erb

```erb
<!-- somewhere in your body tag -->
<div id="basemate_ui">
  <%= yield %>
</div>
```
Note: Wrap your classic 'yield' with a div and assgin the id  "basemate_ui"

Your Controller Action:

app/controllers/tasks_controller.rb

```ruby
class TasksController < ApplicationController

  include Matestack::Ui::Core::ApplicationHelper

  def list
    # use a basemate page as response
    responder_for(Pages::Tasks::List)
  end

end
```
As you can see, we tell the "list" action to respond with a basemate page instead
of using the classic Rails view

Now we define our basemate page:

app/basemate/pages/tasks/list.rb

```ruby
class Pages::Tasks::List < Page::Cell::Page

  # prepare the rendering and get data from the database
  def prepare
    # for this example we just take the last 5 records
    @tasks = Task.last(5)
  end

  # define our page in the response method
  # use core components ("div", "plain") and align
  # them to each other
  def response
    components {
      div do
        @tasks.each do |task|
          div do
            plain task.name
          end
        end
      end
    }
  end

end
```

Let's see, what our output looks like:
