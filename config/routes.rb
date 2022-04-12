Rails.application.routes.draw do
  resources :articles
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    # omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
    unlocks: "users/unlocks"
  }
  resources :video_watching_histories do
    collection do
      get :summary
      get :summary2
    end
  end
  post '/test', to: 'application#test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # mount CheeseApi::Engine, at: '/api/cheese'
end
