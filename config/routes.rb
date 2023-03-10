# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'authentication/sessions#new'

  namespace :authentication, path: '', as: '' do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create]
    post 'logout', to: 'sessions#logout'
  end

  resources :notes, except: %i[show]
  get 'notes/sort/:field' => 'notes#sort', as: 'sort_notes'
  get 'notes/search' => 'notes#search', as: 'search_notes'

  get '*path', to: 'errors#not_found'
end
