Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      resources :rides do
        collection do
          get 'start'
        end
        member do
          get 'stop'
        end
      end
    end
