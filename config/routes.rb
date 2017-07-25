Rails.application.routes.draw do

  devise_for :users
  authenticate :user do
    resources :companies, only: [:index, :new, :create, :show, :destroy]
    resources :inspections, only: [:index, :new, :create, :show, :edit, :destroy, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
