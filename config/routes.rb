Rails.application.routes.draw do
  devise_for :teams
  root "posts#index"
  resources :posts do
    get :search, on: :collection
  end
  resources :teams, only: [:index, :show] do
    get :affiliation, on: :member
  end
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
