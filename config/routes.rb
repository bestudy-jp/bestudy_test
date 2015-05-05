Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :inquiries, only: [:create]
  get '/home/genre' => 'home#genre', as: :select_genre
  post '/home/judge' => 'home#judge', as: :judge

  namespace :admin do
    root to: 'questions#index'
    resources :targets
    resources :genres
    resources :questions
    resources :answers
    resources :lessons
    resources :text_books
    resources :chats
  end

  post 'lesson/:id/purchase' => 'lesson#purchase', as: :buy_lesson
  get 'lesson/:id' => 'lesson#show', as: :lesson_show
  get 'lesson/:id/result' => 'lesson#result', as: :lesson_result

  post 'chats' => 'chat#create', as: :create_chat

  root to: 'top#index'
  get "home", to: "home#genre", as: "user_root"
  get ':controller(/:action(/:id(.:format)))'
  post ':controller(/:action(/:id(.:format)))'
end
