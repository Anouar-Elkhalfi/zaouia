Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  # Routes pour les médecins et administrateurs pour gérer les MedicalCares
  resources :medical_cares, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]  # Imbrication des reviews dans les medical_cares
  end

  # Routes pour la gestion des reviews (destruction accessible aux admins)
  resources :reviews, only: [:destroy]
end






 # get 'medical_cares', to: 'medical_cares#index', as: 'medical_cares'
  # get 'medical_cares/new', to: 'medical_cares#new', as: 'new_medical_care'
  # get 'medical_cares/:id', to: 'medical_cares#show', as: 'medical_care'
  # post 'medical_cares', to: 'medical_cares#create'
  # get 'medical_cares/:id/edit', to: 'medical_cares#edit', as: 'edit_medical_care'
  # patch 'medical_cares/:id', to: 'medical_cares#update'
  # delete 'medical_cares/:id', to: 'medical_cares#destroy'
  # <==>  resources :medical_cares
