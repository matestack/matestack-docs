Rails.application.routes.draw do
  root to: 'docs_app#home'

  scope :api do
    get '/components/*key', to: 'docs_app#components', as: 'components'
    get '/*key', to: 'docs_app#api', as: 'api'
  end

  scope :spec do
    get '/*key', to: 'docs_app#spec', as: 'spec'
  end

  scope :guides do
    get '/*key', to: 'docs_app#guides', as: 'guides'
  end

end
