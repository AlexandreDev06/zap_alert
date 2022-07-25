# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'dashboards#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }

end
