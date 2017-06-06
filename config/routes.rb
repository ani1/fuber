Rails.application.routes.draw do
  get 'cabs/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rides do
    collection do
      get 'start'
    end
    member do
      get 'stop'
    end
  end

  resources :users do
    resources :cabs, only: [:index]
  end
end
