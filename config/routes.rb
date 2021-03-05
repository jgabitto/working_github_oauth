Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'auth/github/callback:code', to: 'omniauth#github'
    end
  end
end
