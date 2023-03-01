# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/authentication'
  root to: 'pages#authentication'
end
