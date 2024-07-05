Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'medical_cares', to: 'medical_cares#index'
end
