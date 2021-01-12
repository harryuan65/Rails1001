Rails.application.routes.draw do
  root "home#index"
  resources :articles
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    # omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
    unlocks: "users/unlocks"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
