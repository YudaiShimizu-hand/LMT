Rails.application.routes.draw do
  root 'channels#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    # sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/users/:id' , to: 'users#show'
  get '/users/:id/edit' , to: 'users#edit'
  post '/users/:id/edit' , to: 'users#update'
  # Defines the root path route ("/")
  resources :channels

  get '/channel_contents/:channel_id', to: 'channel_contents#index', as: 'channel_content'
  get '/channel_contents/:channel_id/new', to: 'channel_contents#new', as: 'channel_content_new'
  post '/channel_contents/:channel_id/create', to: 'channel_contents#create', as: 'channel_content_create'
  # root "articles#index"
end
