Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :home, only: [:index] do
    collection do
      get   :encrypt_text
      get   :decrypt_text
    end
  end

  resources :profile, only: [:index]
end
