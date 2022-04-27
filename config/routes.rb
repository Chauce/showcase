Rails.application.routes.draw do
  resources :forecasts
  resources :camps
  root 'camps#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
