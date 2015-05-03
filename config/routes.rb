Rails.application.routes.draw do
  resources :inquiries, only: [:create]
  post '/home/judge' => 'home#judge', as: :judge

  root to: 'top#index'
  get ':controller(/:action(/:id(.:format)))'
  post ':controller(/:action(/:id(.:format)))'

  get '/auth/:provider/callback', to: 'users#create',       as: :auth_callback
  get '/auth/failure', to: 'users#auth_failure', as: :auth_failure
end
