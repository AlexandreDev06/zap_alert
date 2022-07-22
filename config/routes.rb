# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'dashboards#index'
end
