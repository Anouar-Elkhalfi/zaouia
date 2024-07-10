Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  resources :medical_cares do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  # get 'medical_cares', to: 'medical_cares#index', as: 'medical_cares'
  # get 'medical_cares/new', to: 'medical_cares#new', as: 'new_medical_care'
  # get 'medical_cares/:id', to: 'medical_cares#show', as: 'medical_care'
  # post 'medical_cares', to: 'medical_cares#create'
  # get 'medical_cares/:id/edit', to: 'medical_cares#edit', as: 'edit_medical_care'
  # patch 'medical_cares/:id', to: 'medical_cares#update'
  # delete 'medical_cares/:id', to: 'medical_cares#destroy'
  # <==>  resources :medical_cares
end
