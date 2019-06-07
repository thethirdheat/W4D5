Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :new, :destroy]
  resources :users, only:[:new, :create] do
    resources :goals , only: [:create, :destroy, :new, :edit]
  end
  resources :goals, only: [:index, :show]
end
