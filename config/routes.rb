Rails.application.routes.draw do

  root to: 'landingpage#home'

  get 'bangkok_challenge', to: 'landingpage#rubyconfth'
  get 'imprint', to: 'landingpage#imprint'
  get 'privacy', to: 'landingpage#privacy'

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
