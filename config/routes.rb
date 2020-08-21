Rails.application.routes.draw do

  root :to => redirect('/docs/guides/README.md')

  # scope :api do
  #   get '/components/*key', to: 'docs_app#components', as: 'components'
  #   get '/*key', to: 'docs_app#api', as: 'api'
  # end

  scope :docs do
    scope :guides do
      get '/*key', to: 'docs_app#guides', as: 'guides'
    end
    scope :api do
      # get '/*', to: 'docs_app#api', as: 'api'

      get '/(1-)base/*key', to: 'docs_app#base_api', as: 'base_api'
      # get '/(1-)base/*key', to: 'docs_app#base_api'
      get '/(2-)components/*key', to: 'docs_app#components_api', as: 'components_api'
      # get '/2-components/*key', to: 'docs_app#components_api'
    end
  end

end
