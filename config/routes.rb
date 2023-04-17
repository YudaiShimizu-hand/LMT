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
  # root "articles#index"
end
