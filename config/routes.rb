Rails.application.routes.draw do
  root "users#index"

  resources :users do
    get :notify
  end
end
