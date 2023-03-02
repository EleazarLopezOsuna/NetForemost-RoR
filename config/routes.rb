# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'authentication/sessions#new'

  namespace :authentication, path: '', as: '' do
    resources :users, only: %i[new create]
    resources :sessions, only: %i[new create]
  end

  resources :notes
end
