Rails.application.routes.draw do
namespace :api do
  namespace :v1 do
      resources :todos
      resources :lists
      resources :users
      post '/login', to: 'users#login'


    end 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
