Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :past_reservations
    end
  end
  
  resources :reservations,  except: [:new]
  resources :calendars,  only: [:index, :show]
  resources :members, except: [:show]
end