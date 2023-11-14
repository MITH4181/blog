# config/routes.rb

Rails.application.routes.draw do
    root "articles#index"
  
    resources :articles do
      resources :comments
    end
  
    get 'calendar_events/index'
    resources :calendar_events
  end