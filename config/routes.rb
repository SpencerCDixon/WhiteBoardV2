Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  root "welcome#index"

  resources :profiles, only: [:new, :create, :show]
  resources :families, only: [:new, :create] do
    resources :family_messages, only: [:create]
  end
end
