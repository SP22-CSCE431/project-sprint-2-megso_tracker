# frozen_string_literal: true

Rails.application.routes.draw do
  resources :officers
  resources :rewards
  get 'users/new'
  get 'sessions/new'
  resources :events do
    get 'list', to: 'events#list'
    resources :attendee_lists
  end

  post 'events/register/:id', to: 'events#register', as: 'register_event'

  resources :occupations
  resources :alumnis do
    member do
      get 'delete', to: 'alumnis#delete'
    end
  end
  resources :users

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :events

  get 'events/delete/:id', to: 'events#delete', as: 'delete_event'
  get 'student_events/signup/:id', to: 'student_events#signup', as: 'signup_event'
  root 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
