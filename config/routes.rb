Rails.application.routes.draw do
  resources :welcomes
  get 'welcome/index'

  resources :folders do
    member do
      get :back
    end
  end

  resources :spams
  resources :articles


  #root 'folders#index'
  root 'welcomes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
