Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'medical_cares', to: 'medical_cares#index'
  get 'medical_cares/:id', to: 'medical_cares#show'
end
