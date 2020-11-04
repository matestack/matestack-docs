Rails.application.routes.draw do

  root :to => redirect('/docs/start/README.md')

  scope :docs do
    get '/guides/*key', :to => redirect('/docs/start/README.md') #redirect former guides path
    get '/api/(000-)base/*key', :to => redirect('/docs/start/README.md') # redirect former base api path
    get '/api/(100-)components/*key', :to => redirect('/docs/api/%{key}.md') # redirect former component api path


    get '/start/*key', to: 'docs_app#core_start', as: 'core_start'
    get '/ui_components/*key', to: 'docs_app#core_ui_components', as: 'core_ui_components'
    get '/reactive_components/*key', to: 'docs_app#core_reactive_components', as: 'core_reactive_components'
    get '/reactive_apps/*key', to: 'docs_app#core_reactive_apps', as: 'core_reactive_apps'
    get '/api/*key', to: 'docs_app#core_api', as: 'core_api'

    scope :addons do
      get 'start/*key', to: 'docs_app#addons', as: 'addons_start'
    end

  end


end
