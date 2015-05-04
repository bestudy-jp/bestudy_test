Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
  get "home", to: "home#index", as: "user_root"
  get ':controller(/:action(/:id(.:format)))'
  post ':controller(/:action(/:id(.:format)))'
end
