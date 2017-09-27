Rails.application.routes.draw do
  resources :manages
  resources :numbers
  resources :ruletypes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'codility', to:'codility#index'
  get 'about', to:'pages#about'
  root to: 'pages#home'
  
  namespace :api do
    #resources :numbersapi do
      post 'number_retrieve/:num', :controller => '/api/numbers', :action => 'number_retrieve'
      post 'number_create/:number,:cn,:prefix,:mcdu,:countrycode', :controller => '/api/numbers', :action => 'number_create'
    #end
  end
end
