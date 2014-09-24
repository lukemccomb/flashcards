Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  resources :decks do
    resources :cards, except: :index
  end

end
