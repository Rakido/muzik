Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :instruments, only: [:index, :show, :new, :create] do
    # as musician
    resources :reservations, only: [:new, :create]
  end

  resource :profile, only: [:show]

  # as owner
  resources :demands, only: [] do
    member do
      patch :accept
      patch :refuse
    end
  end

  get 'styleguide', to: 'pages#styleguide'
end
