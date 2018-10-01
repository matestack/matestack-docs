Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'website#home'

  get "page_1", to: 'website#page_1'
  get "page_2", to: 'website#page_2'

end
