Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/guides/introduction')

  scope :guides do
    get "/:key", to: 'guides#resolve', as: "guides"
  end

  scope :demos do
    get "/", to: 'demos#start', as: "demos_start"
    get "action_demo", to: 'demos#action_demo'
    get "form_demo", to: 'demos#form_demo'
  end

  scope :api_docs do
    get "/:key", to: 'api_docs#resolve', as: "api_docs"
  end

  scope :templates do
    get "/", to: 'templates#start', as: "templates_start"
  end

  scope :plugins do
    get "/", to: 'plugins#start', as: "plugins_start"
  end

  scope :api do

    get "users", to: 'api#users'
    delete "demo_user/:id", to: 'api#delete_demo_user', as: "delete_demo_user"
    post "demo_user", to: 'api#create_demo_user', as: "create_demo_user"

    put '/tasks/:id', to: 'api#update_task', as: 'update_task'
    post '/tasks', to: 'api#create_task', as: 'create_task'

    post '/comments', to: 'api#create_comment', as: 'create_comment'
    delete "comments/:id", to: 'api#delete_comment', as: "delete_comment"
  end

  get "/paper", to: 'guides#paper'

end
