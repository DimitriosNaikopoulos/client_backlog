Rails.application.routes.draw do
  root 'backlogs#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  
  resources :backlogs do
    resources :tickets
  end
end
