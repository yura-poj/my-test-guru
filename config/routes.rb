Rails.application.routes.draw do

  get 'users/new'

  get :login, to: 'sessions#new'

  root to: 'tests#index'

  get :signup, to: 'users#new'

  resources :sessions, only: :create

  resources :users, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
