Rails.application.routes.draw do
  resources :inquiries, only: [:create]
  post '/home/judge' => 'home#judge', as: :judge

  namespace :admin do
    root to: 'questions#index'
    resources :questions
    resources :lessons
    resources :text_books
  end

  get 'lesson/:id' => 'lesson#show', as: :lesson_show

  root to: 'top#index'
  get ':controller(/:action(/:id(.:format)))'
  post ':controller(/:action(/:id(.:format)))'

  get '/auth/:provider/callback', to: 'users#create',       as: :auth_callback
  get '/auth/failure', to: 'users#auth_failure', as: :auth_failure
end
