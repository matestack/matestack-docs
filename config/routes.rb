Rails.application.routes.draw do

  root to: redirect('/docs/install')

  scope :docs do
    get '/components/*key', to: 'components#resolve', as: "components"
    get '/*key', to: 'docs#resolve', as: "docs"
  end


  scope :spec do
    get '/*key', to: 'spec#resolve', as: "spec"
  end

  scope :guides do
    get '/*key', to: 'guides#resolve', as: "guides"
  end

end
