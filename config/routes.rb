Rails.application.routes.draw do
  get 'feedback/create'
  get 'feedback/feedback'
  get 'language/change_language'
  root to: 'tests#index'
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout},
             controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      get :result_if_test_is_completed
      post :gist
    end
  end

  resources :badges, only: %i[show index]

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
      member do
        put :update_inline
        patch :update_inline
      end
    end
    resources :gists, only:  %i[show index]
    resources :badges
  end
end
