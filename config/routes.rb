Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'docs#start'

  scope :docs do
    get "start", to: 'docs#start'
    get "motivation", to: 'docs#motivation'
    get "setup_sprockets", to: 'docs#setup_sprockets'
    get "setup_webpacker", to: 'docs#setup_webpacker'
    get "page_usage", to: 'docs#page_usage'
    get "app_usage", to: 'docs#app_usage'
    get "component_usage", to: 'docs#component_usage'
  end

  get "button_demo", to: 'button_demo#show'
  delete "demo_user/:id", to: 'button_demo#delete', as: "delete_demo_user"


end
