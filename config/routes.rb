Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  # Routes accessibles à tous les utilisateurs pour consulter les MedicalCares
  resources :medical_cares, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  # Routes réservées aux administrateurs pour la gestion des MedicalCares
  namespace :admin do
    resources :medical_cares, only: [:new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:destroy]
  end

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
