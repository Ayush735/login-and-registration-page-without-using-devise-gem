Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :registration, only: [:new, :create]

  resources :session, only: [:new] do
    collection do
      post :login
      get :logout
    end  
  end
  resources :user, only: [:show]  
end
