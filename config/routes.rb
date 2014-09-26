Rails.application.routes.draw do
  root to: "homes#index"

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  resources :decks do
    resources :cards, except: :index
  end

end
